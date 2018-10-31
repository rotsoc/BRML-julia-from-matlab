function ancestors(x,A)
    # ancestors of nodes x in DAG A
    # e.g. ancestors([1 2],A)
    N=size(A,1)
    # include self transitions
    for i=1:N,j=1:N
        if i==j
            A[i,j]+=1
        end
    end
    # find descendants after N
    # updates (excluding self-self paths)
    AD=A^N
    for i=1:N,j=1:N
        AD[i,j]=Int(AD[i,j]>0)
        if i==j
            AD[i,j]-=1
        end
    end
    # find ancestors
    a=[]
    for i=x
        a=unique([a... findall(y->y>0,vec(AD[:,i]))'])
    end
    a=setdiff(a,x)
    return a
end
