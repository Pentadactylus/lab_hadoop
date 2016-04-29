Commands for Lab Hadoop

4.2.1
7.
# creating a Hadoop cluster
curl -v -X POST http://160.85.4.163:8888/haas/ -H 'Category: haas; scheme="http://schemas.cloudcomplab.ch/occi/sm#"; class="kind";' -H 'X-User-Name: zhaw-test-user' -H 'X-Tenant-Name: wp3-teamX' -H 'X-Password: Neisei23' -H 'X-Region-Name: ZH' -H 'content-type: text/occi' -H 'X-OCCI-Attribute: icclab.haas.rootfolder="/home/ubuntu/sm_openstack/sm/managers/data",icclab.haas.master.sshkeyname="key-teamX"'

10.
# get status of created Hadoop cluster
curl -v -X GET http://160.85.4.163:8888/haas/some-uuid-field -H 'Accept: text/occi' -H 'X-Tenant-Name: wp3-teamX' -H 'X-User-Name: zhaw-test-user' -H 'X-Password: Neisei23' -H 'X-Region-Name: ZH'

4.2.2
a)
chmod 0600 your-team-x
ssh -i your-team-x ubuntu@<floating-ip>
mkdir teamX

b)
scp –i your-team-x WordCount.java ubuntu@<floating-ip>:~/teamX/

c)
source /etc/bash.bashrc
cd ~/teamX
javac -classpath $CLASSPATH WordCount.java
jar -cvf wordcount.jar *.class

hdfs dfs -mkdir /teamX
hdfs dfs -put /home/ubuntu/deployment.log /teamX/
hdfs dfs -ls /teamX

hadoop jar ~/teamX/wordcount.jar WordCount /teamX/deployment.log /teamX/output
hdfs dfs -ls /teamX
hdfs dfs -ls /teamX/output
hdfs dfs -cat /teamX/output/part-r-00000
