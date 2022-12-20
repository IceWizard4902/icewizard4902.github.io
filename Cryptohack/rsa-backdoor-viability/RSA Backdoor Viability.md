# RSA Backdoor Viability

I hate recursion depths. Sage on Windows sucks at configuring anything related to this.

The challenge gives a peculiar way of generating primes

```python
def get_complex_prime():
    D = 427
    while True:
        s = random.randint(2 ** 1020, 2 ** 1021 - 1)
        tmp = D * s ** 2 + 1
        if tmp % 4 == 0 and isPrime((tmp // 4)):
            return tmp // 4
```

And given the name of the challenge, we are pretty sure that this leads to a vulnerability. Indeed, the name of the challenge leads to a paper regarding the $4p - 1$ method and the related RSA backdoor viability.

The [Github repo](https://github.com/crocs-muni/cm_factorization) containing the code. The paper is at this [link](https://crocs.fi.muni.cz/_media/public/papers/2019-secrypt-sedlacek.pdf). The Github repo should contain the script for factorising primes in the form of `4p - 1`, and `D = 427` as seen in the Python code above. 

Modified Sage script, kudos to `ConnorM`: 

```python
class FactorRes(object):
    def __init__(self, r=None, c=None, u=None, a=None):
        self.r = r
        self.c = c
        self.u = u
        self.a = a

def xgcd(f, g, N):
    toswap = False
    if f.degree() < g.degree():
        toswap = True
        f, g = g, f
    r_i = f
    r_i_plus = g
    r_i_plus_plus = f
    s_i, s_i_plus = 1, 0
    t_i, t_i_plus = 0, 1
    while (True):
        lc = r_i.lc().lift()
        lc *= r_i_plus.lc().lift()
        lc *= r_i_plus_plus.lc().lift()
        divisor = gcd(lc, N)
        if divisor > 1:
            return divisor, None, None
        q = r_i // r_i_plus
        s_i_plus_plus = s_i - q * s_i_plus
        t_i_plus_plus = t_i - q * t_i_plus
        r_i_plus_plus = r_i - q * r_i_plus
        if r_i_plus.degree() <= r_i_plus_plus.degree() or r_i_plus_plus.degree() == -1:
            if toswap == True:
                return r_i_plus, t_i_plus, s_i_plus
            else:
                return r_i_plus, s_i_plus, t_i_plus,
        r_i, r_i_plus = r_i_plus, r_i_plus_plus
        s_i, s_i_plus = s_i_plus, s_i_plus_plus
        t_i, t_i_plus = t_i_plus, t_i_plus_plus

def Qinverse (Hx, a, N):
    r,s,t = xgcd(a.lift(), Hx, N)
    if (s,t) == (None, None):
        res = r, 0
    else:
        rinv = r[0]^(-1)
        res = 1, s * rinv
    return res

def CMfactor(D, N):
    Hx = hilbert_class_polynomial(-D)
    res = FactorRes()
    ZN = Integers(N)
    R.<x> = PolynomialRing(ZN)
    Hx = R(Hx)
    Q.<j> = QuotientRing(R, R.ideal(Hx))
    gcd, inverse = Qinverse(Hx, 1728 - j, N)
    if gcd == 1:
        a = Q(j * inverse)
    return CMfactor_core(N, a, Q, ZN, Hx, res)

def CMfactor_core(N, a, Q, ZN, Hx, res):
    for c in [1..10]:
        E = EllipticCurve(Q, [0, 0, 0, 3 * a * c ^ 2, 2 * a * c ^ 3])
        for u in [1..10]:
            rand_elem = ZN.random_element()
            res.rand_elem = int(rand_elem)
            w = E.division_polynomial(N, Q(rand_elem), two_torsion_multiplicity=0)
            poly_gcd = xgcd(w.lift(), Hx, N)[0]
            r = gcd(ZZ(poly_gcd), N)
            res.c = c
            res.u = u
            if r > 1 and r != N:
                return r, N//r

def main():
    sys.setrecursionlimit(50000)
    #####################################INPUTS####################################
    d = 427
    n = ...
    c = ...
    e = 65537
    #####################################INPUTS####################################

    p, q = CMfactor(d, n)

    phi = (p - 1) * (q - 1)
    d = pow(e, -1, phi)
    flag = int(pow(c, d, n))
    print(flag.to_bytes((flag.bit_length() + 7) // 8, 'big').decode())

if __name__ == "__main__":
    main()
```

A good rule of thumb for the challenges with the weird prime generation - FactorDB always [work](http://factordb.com/index.php?query=709872443186761582125747585668724501268558458558798673014673483766300964836479167241315660053878650421761726639872089885502004902487471946410918420927682586362111137364814638033425428214041019139158018673749256694555341525164012369589067354955298579131735466795918522816127398340465761406719060284098094643289390016311668316687808837563589124091867773655044913003668590954899705366787080923717270827184222673706856184434629431186284270269532605221507485774898673802583974291853116198037970076073697225047098901414637433392658500670740996008799860530032515716031449787089371403485205810795880416920642186451022374989891611943906891139047764042051071647203057520104267427832746020858026150611650447823314079076243582616371718150121483335889885277291312834083234087660399534665835291621232056473843224515909023120834377664505788329527517932160909013410933312572810208043849529655209420055180680775718614088521014772491776654380478948591063486615023605584483338460667397264724871221133652955371027085804223956104532604113969119716485142424996255737376464834315527822566017923598626634438066724763559943441023574575168924010274261376863202598353430010875182947485101076308406061724505065886990350185188453776162319552566614214624361251463), and probably will save your sanity in fixing the recursion depths of Python in Sage.