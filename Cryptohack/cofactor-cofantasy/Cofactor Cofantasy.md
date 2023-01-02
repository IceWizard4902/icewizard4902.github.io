# Cofactor Cofantasy

We can factor $N$ using the given `phi`, or just simply look up the number on `FactorDB`. If the number returned has the form of $c = g ^ {k}$ with some even number $k$, we have the observation that for every factor of $N$, $c$ is a quadratic residue under that base, whereas the randomly generated number almost never generate a number that is a quadratic residue of all factors.

However, there is some chance that $c = g ^ q$, where $q$ is some odd number. Hence, with probability $\frac{1}{2}$, the number returned (if the flag bit is 1) has a $\frac{1}{2}$ chance of returning a quadratic residue to all bases. With 10 tries to generate the $c$ value, the probability that one quadratic residue is returned is $\frac{1023}{1024}$. Hence, we most likely will have some quadratic residue returned after 10 tries, if the flag bit is indeed 1.

Python Implementation:

```python
import json 
from tqdm import tqdm
from pwn import * 

N = 56135841374488684373258694423292882709478511628224823806418810596720294684253418942704418179091997825551647866062286502441190115027708222460662070779175994701788428003909010382045613207284532791741873673703066633119446610400693458529100429608337219231960657953091738271259191554117313396642763210860060639141073846574854063639566514714132858435468712515314075072939175199679898398182825994936320483610198366472677612791756619011108922142762239138617449089169337289850195216113264566855267751924532728815955224322883877527042705441652709430700299472818705784229370198468215837020914928178388248878021890768324401897370624585349884198333555859109919450686780542004499282760223378846810870449633398616669951505955844529109916358388422428604135236531474213891506793466625402941248015834590154103947822771207939622459156386080305634677080506350249632630514863938445888806223951124355094468682539815309458151531117637927820629042605402188751144912274644498695897277
phi = 56135841374488684373258694423292882709478511628224823806413974550086974518248002462797814062141189227167574137989180030483816863197632033192968896065500768938801786598807509315219962138010136188406833851300860971268861927441791178122071599752664078796430411769850033154303492519678490546174370674967628006608839214466433919286766123091889446305984360469651656535210598491300297553925477655348454404698555949086705347702081589881912691966015661120478477658546912972227759596328813124229023736041312940514530600515818452405627696302497023443025538858283667214796256764291946208723335591637425256171690058543567732003198060253836008672492455078544449442472712365127628629283773126365094146350156810594082935996208856669620333251443999075757034938614748482073575647862178964169142739719302502938881912008485968506720505975584527371889195388169228947911184166286132699532715673539451471005969465570624431658644322366653686517908000327238974943675848531974674382848
g = 986762276114520220801525811758560961667498483061127810099097

factors = [16567394141556324107484965437698357115399742102575293290747, 91986886828478213472802814993555054129006913989537753096123, 181322805383940703007265906643044843190489788732785182321487, 760363004025578077604626764282706830072847466932877419051319, 804417174623672415450557634612568265192863476713582219744267, 962196273251325220586440176597115791597983910091568285193479, 1198659778546842874656876799650682636702329592515612873898067, 1257159212779420306219169217946797219783415728365988507869027, 1288911769345182280978162047973381722380823635671566593519807, 1676976510651768067412350964868910593417947379184949447823407, 1779340212039893773391726001368709776860306288741559089532759, 1801752121380249789355959738781230662094667376359625751791543, 2035960746196047990457969452572805869038616040671770568205203, 2127656865180928955386281095823023620786349152280473160223119, 2580048403805885869520594654954918201506476199364198744646143, 2957688520542834742528816032405856023269135282074862187456419]

def legendre_symbol(a, p):
    return pow(a, (p - 1) // 2, p)

def test_quadratic(a):
    for factor in factors:
        if legendre_symbol(a, factor) != 1:
            return 0
    return 1

FLAG = b"crypto{???????????????????????????????????}"
recover = [0 for i in range(len(FLAG))]

io = remote('socket.cryptohack.org', 13398)
io.recvline()

to_send = dict()
to_send['option'] = 'get_bit'

for i in tqdm(range(8 * len(FLAG))):
    for _ in range(20):
        to_send['i'] = i
        io.sendline(json.dumps(to_send).encode())
        bit = json.loads(io.recvline().decode())['bit']
        bit = int(bit[2:], 16)
        
        if test_quadratic(bit):
            recover[i // 8] += (1 << (i % 8))
            break
    
    if i % 8 == 0:
        print(recover)

FLAG = list(map(lambda x: chr(x), recover))
print("".join(FLAG))
```

There is also a solution that does not involve mathematics. When the `i-th` bit is 1, the server will perform the exponential operation with some random exponent. Otherwise, the server will send a random value. It is clear that picking random and doing exponential operation is slower than just picking out randomly. 

Hence, we can do a timing side channel attack with this observation. The implementation is kudos to `p4b`:

```python
import time
from telnetlib import Telnet 
import json
from statistics import median,mean
from tqdm import tqdm,trange

def two_clursturing(datas, epoch=10):
    centor = [min(datas), max(datas)]
    label=[0]* len(datas)
    for _ in range(epoch):
        bag=[[], []]
        for i in range(len(datas)):
            if abs(datas[i]-centor[0]) < abs(datas[i]-centor[1]):
                label[i] = 0
                bag[0].append(datas[i])
            else:    
                label[i] = 1
                bag[1].append(datas[i])
        centor[0] = mean(bag[0])
        centor[1] = mean(bag[1])
        centor.sort()
    return label

cli = Telnet("socket.cryptohack.org",13398)

print(cli.read_until(b"\n"))

# Higher = slower&better
precision = 10

found = b""
pbar = trange(0*8,43*8,8)
for i in pbar:
    val = 0
    ssamp = []
    for j in trange(8,leave=False):
        sample = []
        query = {"option":"get_bit","i":i+j}
        eq = json.dumps(query).encode()
        for _ in range(precision):
            st = time.time_ns()
            cli.write(eq)
            cli.read_until(b"\n")
            ed = time.time_ns()
            sample.append(ed-st)
        ssamp.append(median(sample))

    b = "".join(map(str,two_clursturing(list(reversed(ssamp)))))
    found += bytes([int(b,2)])
    pbar.set_description(str(found))
    
print(found)
```

Again, there are some other solution involving finding the order of element $g$ in the multiplicative group formed under the integer modulo $N$. $N$ is a product of 16 safe primes. Because of this, $2 ^ {16}$ divides $\phi(n)$. Hence, $\phi(n) = 2 ^{16} s$ for some $s$. By Lagrange's theorem, the order of any element in a group divides the order of the group. Hence, $|g|$ divides $2 ^{16}$. 

Computing $g ^ s$, we observe that $g ^ s \neq 1 \mod N$, but $g ^ {2s} = 1 \mod N$. Hence, if the flag bit is 1, and the server returns some even number $e$, then we have: 

$$
(g ^ {e})^s = g ^ {es} = 1 \mod N
$$

If the $i-th$ bit is 0, the probability that the random number returned has the order of $s$ is practically negligible. Hence it is unlikely that $x ^ s = 1 \mod N$.

crypto{r34l_t0_23D_m4p}