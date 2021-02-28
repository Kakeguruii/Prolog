age(albedo, 2).
age(barbara, 2).
age(bennet, 2).
age(venti, 2).
age(ganyu, 2).
age(jean, 3).
age(diluc, 3).
age(diona, 1).
age(klee, 1).
age(keqing, 2).

age(lisa, 3).
age(mona, 2).
age(ningguang, 3).
age(razor, 2).
age(sucrose, 2).
age(xiangling, 2).
age(xiao, 2).
age(tartaglia, 3).
age(fischl, 2).
age(qiqi, 1).

age(zhongli, 3).
age(ayaka, 2).
age(rosaria, 3).
age(yaoyao, 1).
age(hutao, 2).
age(saino, 2).
age(dainsleif, 3).
age(scaramouche, 2).
age(signora, 3).
age(baizhu, 3).

gender(albedo, 1).
gender(barbara,2).
gender(bennet, 1).
gender(venti, 1).
gender(ganyu, 2).
gender(jean, 2).
gender(diluc, 1).
gender(diona, 2).
gender(klee, 2).
gender(keqing, 2).

gender(lisa, 2).
gender(mona, 2).
gender(ningguang, 2).
gender(razor, 1).
gender(sucrose, 2).
gender(xiangling, 2).
gender(xiao, 1).
gender(tartaglia, 1).
gender(fischl, 2).
gender(qiqi, 2).

gender(zhongli, 1).
gender(ayaka, 2).
gender(rosaria, 2).
gender(yaoyao, 2).
gender(hutao, 2).
gender(saino, 1).
gender(dainsleif, 1).
gender(scaramouche, 1).
gender(signora, 2).
gender(baizhu, 1).

element(albedo, 4).
element(barbara, 2).
element(bennet, 1).
element(venti, 3).
element(ganyu, 6).
element(jean, 3).
element(diluc, 1).
element(diona, 6).
element(klee, 1).
element(keqing, 5).

element(lisa, 5).
element(mona, 2).
element(ningguang, 4).
element(razor, 5).
element(sucrose, 3).
element(xiangling, 1).
element(xiao, 3).
element(tartaglia, 2).
element(fischl, 5).
element(qiqi, 6).

element(zhongli, 4).
element(ayaka, 6).
element(rosaria, 6).
element(yaoyao, 7).
element(hutao, 1).
element(saino, 1).
element(dainsleif, 2).
element(scaramouche, 5).
element(signora, 6).
element(baizhu, 7).

nation(albedo, 1).
nation(barbara, 1).
nation(bennet, 1).
nation(venti, 1).
nation(ganyu, 2).
nation(jean, 1).
nation(diluc, 1).
nation(diona, 1).
nation(klee, 1).
nation(keqing, 2).

nation(lisa, 1).
nation(mona, 1).
nation(ningguang, 2).
nation(razor, 1).
nation(sucrose, 1).
nation(xiangling, 2).
nation(xiao, 2).
nation(tartaglia, 2).
nation(fischl, 1).
nation(qiqi, 2).

nation(zhongli, 2).
nation(ayaka, 3).
nation(rosaria, 1).
nation(yaoyao, 3).
nation(hutao, 2).
nation(saino, 3).
nation(dainsleif, 3).
nation(scaramouche, 3).
nation(signora, 3).
nation(baizhu, 2).

weapon(albedo, 3).
weapon(barbara, 1).
weapon(bennet, 3).
weapon(venti, 2).
weapon(ganyu, 2).
weapon(jean, 3).
weapon(diluc, 4).
weapon(diona, 2).
weapon(klee, 1).
weapon(keqing, 3).

weapon(lisa, 1).
weapon(mona, 1).
weapon(ningguang, 1).
weapon(razor, 4).
weapon(sucrose, 1).
weapon(xiangling, 5).
weapon(xiao, 5).
weapon(tartaglia, 2).
weapon(fischl, 2).
weapon(qiqi, 3).

weapon(zhongli, 5).
weapon(ayaka, 3).
weapon(rosaria, 5).
weapon(yaoyao, 1).
weapon(hutao, 5).
weapon(saino, 5).
weapon(dainsleif, 3).
weapon(scaramouche, 1).
weapon(signora, 1).
weapon(baizhu, 1).

role(albedo, 3).
role(barbara, 2).
role(bennet, 3).
role(venti, 3).
role(ganyu, 1).
role(jean, 2).
role(diluc, 1).
role(diona, 2).
role(klee, 1).
role(keqing, 1).

role(lisa, 3).
role(mona, 3).
role(ningguang, 1).
role(razor, 1).
role(sucrose, 3).
role(xiangling, 3).
role(xiao, 1).
role(tartaglia, 1).
role(fischl, 3).
role(qiqi, 2).

role(zhongli, 1).
role(ayaka, 1).
role(rosaria, 1).
role(yaoyao, 2).
role(hutao, 1).
role(saino, 3).
role(dainsleif, 1).
role(scaramouche, 3).
role(signora, 1).
role(baizhu, 2).


question1(X1):-		write("Choose age: "),nl,
					write("1. Child "),nl,
					write("2. Teenager "),nl,
    				write("3. Adult "),nl,
					read(X1).

question2(X2):-		write("Choose gender: "),nl,
					write("1. Male "),nl,
					write("2. Female "),nl,
					read(X2).

question3(X3):-		write("Choose element: "),nl,
					write("1. Pyro "),nl,
					write("2. Hydro "),nl,
    				write("3. Anemo "),nl,
					write("4. Geo "),nl,
					write("5. Electro "),nl,
					write("6. Cryo "),nl,
					write("7. Dendro "),nl,
					read(X3).

question4(X4):-		write("Choose nation: "),nl,
					write("1. Mondstadt "),nl,
					write("2. Liyue "),nl,
					write("3. Inazuma "),nl,
					read(X4).

question5(X5):-		write("Choose weapon: "),nl,
					write("1. Catalyst "),nl,
					write("2. Bow "),nl,
					write("3. One-handed sword "),nl,
					write("4. Two-handed sword  "),nl,
					write("5. Spear "),nl,
					read(X5).

question6(X6):-		write("Choose role: "),nl,
					write("1. Damager "),nl,
					write("2. Healer "),nl,
					write("3. Support "),nl,
					read(X6).

pr:-	question1(X1),question2(X2),question3(X3),question4(X4),question5(X5),question6(X6),
		age(X,X1), gender(X,X2),element(X,X3),nation(X,X4),weapon(X,X5),role(X,X6),
		write("It's "),write(X).

