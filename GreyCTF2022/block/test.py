test = [i for i in range(1, 17)]
mat = [[test[i * 4 + j] for j in range(4)] for i in range(4)]

for i in range(4):
    for j in range(4):
        print(mat[i][j], mat[(i + 2) % 4][(j + 1) % 4])
