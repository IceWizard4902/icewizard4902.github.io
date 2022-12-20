# Many Prime

The challenge is straightforward - just factor out the modulus used `N`. There are two approaches, one using FactorDB and one using the intended way of using `Sage`. 

Credits to `pdro` solution on Cryptohack: 

```python
n = 580642391898843192929563856870897799650883152718761762932292482252152591279871421569162037190419036435041797739880389529593674485555792234900969402019055601781662044515999210032698275981631376651117318677368742867687180140048715627160641771118040372573575479330830092989800730105573700557717146251860588802509310534792310748898504394966263819959963273509119791037525504422606634640173277598774814099540555569257179715908642917355365791447508751401889724095964924513196281345665480688029639999472649549163147599540142367575413885729653166517595719991872223011969856259344396899748662101941230745601719730556631637
'''
Key observation: the number is 2033 bits and it has 30+ factors. The smallest factor will be ~2033/30 = 68 bits in the worst case (i.e. the size of all factors is even)
This means we should look for algorithms whose time complexity depends on the size of their smaller factor. There are a handful, but these are the most popular:
	* Pollard-Rho (good for smaller numbers)
		- Ran the primefac implementtion for 12 hours and only found 1 factor. Getting them all would have taken a few days.
	* Lenstra's ECM (most acclaimed)
		- Ran with primefac and default B1/B2 params without luck over several hours.
		- Ran with sage, and found the factors in ~5 seconds 
Takeaways: 
  - Don't use small factors, 
  - Sage is great! (or should I credit GMP?)
'''

factors = ecm.factor(n)
```