kind: ReplicaSet
apiVersion: apps/v1
metadata:
  name: rs1
spec:
  replicas: 2
  selector:
    matchExpressions:                             # these must match the labels
      - {key: myname, operator: In, values: [Abhash, Akash, Abd]}
      - {key: env, operator: NotIn, values: [pro]}
  template:
    metadata:
      name: pod1
      labels:
        myname: Abd
    spec:
     containers:
       - name: c1
         image: ubuntu
         command: ["/bin/bash", "-c", "while true; do echo Networks-Globe; sleep 5 ; done"]


