'''
思路：先无量纲化方程，然后用打靶法和numerov方法对E迭代暴力求解，找到满足边界条件的波函数和E。
'''
import numpy as np
import matplotlib.pyplot as plt

plt.rcParams['font.sans-serif']=['SimHei'] #用来正常显示中文标签
plt.rcParams['axes.unicode_minus']=False #用来正常显示负号

N=200  #划分区间数量
x1,x2=-1,1  #实际搜索区间为[x1*L,x2*L]
#############################
h_bar=1.05457*10**(-34)
m_e=9.10956*10**(-31)
L=1*10**(-6)
EE=h_bar*h_bar/(m_e*L*L)
#############################
y1=np.zeros(N)
y2=np.zeros(N)

def one_dim(x):
    return x-x

def sch(x):
    T=np.zeros(x.shape)
    for i in range(len(x)):
        if x[i]<0:
            T[i]=-x[i]
        else:
            T[i]=x[i]*x[i]*x[i]*x[i]
    return T

def next_phi1(i):
    a=1-h**2/12*F[i+1]
    b=2+5*h**2/6*F[i]
    c=-(1-h**2/12*F[i-1])
    return b*y1[i]/a+c*y1[i-1]/a
def next_phi2(i):
    a=1-h**2/12*F[i+1]
    b=2+5*h**2/6*F[i]
    c=-(1-h**2/12*F[i-1])
    return b*y2[i]/a+c*y2[i-1]/a

x=np.linspace(x1,x2,N)
h=(x2-x1)/N
flag,k=0,0 #过滤掉重复的解
n=1
print('一维无限深势阱基态能量理论值：',h_bar*h_bar*np.pi*np.pi/(2*m_e*((x2-x1)*L)**2))

plt.subplot(2, 2, 1)
plt.plot(x,one_dim(x))
plt.title('一维无限深势阱')
plt.subplot(2, 2, 2)
plt.plot(x,sch(x))
plt.title('自定义势阱')
plt.subplot(2, 2, 3)
for E0 in range(1,5000,1):
    E=E0/100
    F=2*(one_dim(x)-E)
    y1[0]=0
    y1[1]=0.1
    for i in range(1,N-1):
        y1[i+1]=next_phi1(i)
    if abs(y1[i+1])<0.1:
        if k==E0-1:    #如果有连续的解，跳过重复的
            k=E0
            continue

        k=E0
        flag=1

        print('n='+str(n)+'能量：',E*EE)
        plt.plot(x,y1,label='n='+str(n))
        n=n+1
        plt.legend()
        plt.xlabel('um')
plt.subplot(2, 2, 4)
n=1
print('自定义势阱')
for E0 in range(1,5000,1):
    E=E0/100
    F=2*(sch(x)-E)
    y2[0]=0
    y2[1]=0.1
    for i in range(1,N-1):
        y2[i+1]=next_phi2(i)
    if abs(y2[i+1])<0.05:
        if k==E0-1:    #如果有连续的解，跳过重复的
            k=E0
            continue

        k=E0
        flag=1

        print('n='+str(n)+'能量：',E*EE)

        plt.plot(x,y2,label='n='+str(n))
        n=n+1
        plt.legend()
        plt.xlabel('um')
plt.show()