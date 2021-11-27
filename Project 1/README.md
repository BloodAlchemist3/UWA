## Automated ELK Stack Deployment

The files in this repository were used to configure the network depicted below.

(Images/diagram_filename.png)

These files have been tested and used to generate a live ELK deployment on Azure. They can be used to either recreate the entire deployment pictured above. Alternatively, select portions of the Ansible file may be used to install only certain pieces of it, such as Filebeat.

  - _TODO: Enter the playbook file._
  (Ansible/Elk playbook.txt)

This document contains the following details:
- Description of the Topology
- Access Policies
- ELK Configuration
  - Beats in Use
  - Machines Being Monitored
- How to Use the Ansible Build


### Description of the Topology

The main purpose of this network is to expose a load-balanced and monitored instance of DVWA, the D*mn Vulnerable Web Application.

Load balancing ensures that the application will be highly available, in addition to restricting unauthorised access to the network.

Integrating an ELK server allows users to easily monitor the vulnerable VMs for changes to the Files and system Configuration.

The configuration details of each machine may be found below.
_Note: Made with the aid of the [Markdown Table Generator](http://www.tablesgenerator.com/markdown_tables).

| Name     | Function   | External IP Address                  | Internal IP Address | Operating System |
|----------|------------|--------------------------------------|---------------------|------------------|
| Jump Box | Gateway    | 20.37.5.155                          | 10.1.0.9            | Linux            |
| Web-1    | DVWA Host  | Via Load Ballancer Red-LB 20.37.4.99 | 10.1.0.7            | Linux            |
| Web-2    | DVWA Host  | Via Load Ballancer Red-LB 20.37.4.99 | 10.1.0.8            | Linux            |
| ELK-VM   | Monitoring | 40.127.65.171                        | 10.0.0.5            | Linux            |

### Access Policies

The machines on the internal network are not exposed to the public Internet. 

Only the JumpBoxProvisioner  can accept connections from the Internet. Access to this machine is only allowed from the following IP addresses:
- 220.250.168.124

Machines within the network can only be accessed by connection via the JumpBoxProvisioner (20.37.5.155).

A summary of the access policies in place can be found in the table below.

| Name     | publicly Accessible | Allowed IP address |
|----------|---------------------|--------------------|
| Web-1    | NO                  | 10.1.0.0           |
| Web-2    | NO                  | 10.1.0.0           |
| ELK      | NO                  | 10.0.0.0           |
| Jump Box | Yes                 | Listed Personal IP |

### Elk Configuration

Ansible was used to automate configuration of the ELK machine. No configuration was performed manually, which is advantageous because of the reduction in human error and it allows for repeatable deployment and expansion should additional machines be required.

The playbook implements the following tasks:
- Install docker onto the VM
- Downlaod the relevant image to be used for the container
- Perform customisation and configuration based on the playbook template.

The following screenshot displays the result of running `docker ps` after successfully configuring the ELK instance.

(Images/docker_ps_output.PNG)

### Target Machines & Beats
This ELK server is configured to monitor the following machines:
| Name  | Function  | External IP                          | Internal IP Address |   |
|-------|-----------|--------------------------------------|---------------------|---|
| Web-1 | DVWA Host | Via Load Ballancer Red-LB 20.37.4.99 | 10.1.0.7            |   |
| Web-2 | DVWA Host | Via Load Ballancer Red-LB 20.37.4.99 | 10.1.0.8            |   |

We have installed the following Beats on these machines:
- FileBeats
- MetricBeats

These Beats allow us to collect the following information from each machine:
- FileBeat: Filebeat monitors the log files or locations that you specify, collects log events, and forwards them either to Elasticsearch or Logstash for indexing.

- Metricbeat; Metricbeat takes the metrics and statistics that it collects and ships them to the output that you specify, such as Elasticsearch or Logstash.

### Using the Playbook
In order to use the playbook, you will need to have an Ansible control node already configured. Assuming you have such a control node provisioned: 

SSH into the control node and follow the steps below:
- Copy the Ansible Playbook file to Ansibel Control Node.
- Update the Playbook file to include the IP address's of the target machines.
- Run the playbook, and navigate to new Kibana instance (the format will need to be http://10.0.0.8:5601) to check that the installation worked as expected.



To use the playbooks, we must perform the following steps:

Copy the playbooks to the Ansible Control Node
Run each playbook on the appropriate targets

The easiest way to copy the playbooks is to use Git:

$ cd /etc/ansible

$ mkdir files

## Clone Repository + IaC Files

$ git clone https://github.com/yourusername/project-1.git

## Move Playbooks and hosts file Into `/etc/ansible`

$ cp project-1/playbooks/* .

$ cp project-1/files/* ./files

This copies the playbook files to the correct place.
Next, you must create a hosts file to specify which VMs to run each playbook on. Run the commands below:

$ cd /etc/ansible

$ cat > hosts <<EOF

[webservers]

10.0.0.5

10.0.0.6

[elk]

10.0.0.8

EOF

After this, the commands below run the playbook:

$ cd /etc/ansible

$ ansible-playbook install_elk.yml elk

$ ansible-playbook install_filebeat.yml webservers

$ ansible-playbook install_metricbeat.yml webservers

To verify success, wait five minutes to give ELK time to start up.
Then, run: curl http://10.0.0.8:5601. This is the address of Kibana. If the installation succeeded, this command should print HTML to the console.
