import sympy as sp

# 创建符号变量
m1, m2, l1, l2, c1, c2, k, s  = sp.symbols('m1 m2 l1 l2 c1 c2 k s')

# 创建矩阵 M
M = sp.Matrix([
    [(1/3) * m1 * l1**2 + m2 * l1**2  , -m2 * l1 * l2],
    [-m2 * l1 * l2 , m2 * l2**2]
])
C = sp.Matrix([[c1+c2 , -c2],[-c2 , c2]])

K = sp.Matrix([[k , 0],[0 , 0]])

# sys =sp.Matrix([1 , 0]).dot((M*s**2 + C*s + K).inv()) * sp.Matrix([1,0])

# sys_simplified = sp.simplify(sys)
print( sp.simplify((M*(s**2) + C*s + K).inv()) )