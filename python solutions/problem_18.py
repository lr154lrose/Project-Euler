# Program finding the path with the biggest sum in a triangle. It works by
# starting at the top of the triangle and moving to adjacent numbers of the
# row below.


def maximum_sum(matrix):
    M = len(matrix)

    for i in range(
        M - 2, -1, -1
    ):  # from the penultimate row until the first one, at position 0
        for j in range(len(matrix[i]) - 1):
            matrix[i][j] = int(matrix[i][j]) + max(
                int(matrix[i + 1][j]), int(matrix[i + 1][j + 1])
            )  # adding the biggest number
        matrix.remove(matrix[i + 1])
    return matrix[0][0]


def triangle_to_regular_matrix(triangle):
    for row in triangle:
        while len(row) != len(triangle[-1]):
            row.append(0)

    return triangle


if __name__ == "__main__":

    triangle = """  75
                95 64
                17 47 82
                18 35 87 10
                20 04 82 47 65
                19 01 23 75 03 34
                88 02 77 73 07 63 67
                99 65 04 28 06 16 70 92
                41 41 26 56 83 40 80 70 33
                41 48 72 33 47 32 37 16 94 29
                53 71 44 65 25 43 91 52 97 51 14
                70 11 33 28 77 73 17 78 39 68 17 57
                91 71 52 38 17 14 91 43 58 50 27 29 48
                63 66 04 68 89 53 67 30 73 16 69 87 40 31
                04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"""

    triangle = triangle.replace("  ", "").splitlines()
    matrix = [row.split(" ") for row in triangle]

    result = triangle_to_regular_matrix(matrix)
    print(maximum_sum(result))
