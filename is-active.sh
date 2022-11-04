 #!/bin/bash 
 echo -n "Enter the name of service to check status:"
 read
 echo $(systemctl is-active $REPLY) 