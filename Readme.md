# **MERN Stack Application Deployment on AWS using Terraform and Ansible**  

## **Project Title**  
TravelMemory: Deploying a Full-Stack MERN Application on AWS with Infrastructure Automation  

## **Project Description**  
This project focuses on deploying a full-stack MERN (MongoDB, Express.js, React.js, Node.js) application called **TravelMemory** on AWS. Terraform is used to provision AWS infrastructure, while Ansible handles server configuration and application deployment. The setup ensures a secure, scalable, and production-ready environment.  

---

### **Table of Contents**  
1. **Technologies Used**  
2. **Requirements**  
3. **Installation Instructions**  
4. **Usage Instructions**  
5. **Documentation**  

---

### **Technologies Used**  
- **AWS**: Cloud platform for hosting infrastructure.  
- **Terraform**: Infrastructure-as-Code tool to automate AWS resource provisioning.  
- **Ansible**: Configuration management tool for server setup and deployment.  
- **MERN Stack**:  
  - **MongoDB**: Database for application data.  
  - **Express.js**: Backend framework.  
  - **React.js**: Frontend framework for the user interface.  
  - **Node.js**: JavaScript runtime for the backend.  
- **Nginx**: Reverse proxy server for routing requests to frontend and backend.  

---

### **Requirements**  
1. **AWS Account** with permissions to manage VPC, EC2, and IAM resources.  
2. **Terraform** installed. [Terraform Installation Guide](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)  
3. **Ansible** installed. [Ansible Installation Guide](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)  
4. An **SSH key pair** for EC2 instance access.  
5. Basic knowledge of MERN stack and cloud computing.  

---

### **Installation Instructions**  

#### **Step 1: Clone the Repository**  
Clone the project to your local machine:  
```bash
git clone https://github.com/YourRepo/mern-aws-deployment.git  
cd mern-aws-deployment  
```  

#### **Step 2: Configure Terraform**  
1. Initialize Terraform:  
   ```bash
   terraform init  
   ```  
2. Update the `terraform.tfvars` file with your AWS details, SSH key, and other required variables.  
3. Apply the Terraform configuration:  
   ```bash
   terraform apply  
   ```  
4. Confirm the changes to create AWS resources.  

#### **Step 3: Verify Infrastructure**  
- Check the AWS Management Console to ensure resources (VPC, subnets, EC2 instances, and security groups) are provisioned.  
- Verify the dynamic Ansible inventory file (`inventory.yml`) is generated in the `ansible` directory.  

#### **Step 4: Run Ansible Playbooks**  
1. Navigate to the `ansible` directory:  
   ```bash
   cd ansible  
   ```  
2. Execute the playbooks:  
   ```bash
   ansible-playbook -i inventory.yml playbooks/deploy_app.yml  
   ```  

---

### **Usage Instructions**  

#### **Access the Application**  
- Use the **public IP** of the web server to access the application:  
  ```plaintext
  http://<web-server-public-ip>  
  ```  

#### **Test the Frontend**  
- Verify the React frontend communicates with the backend.  

#### **Test the Backend**  
- APIs are accessible at:  
  ```plaintext
  http://<web-server-public-ip>:3001  
  ```  

#### **Verify the Database**  
- MongoDB is running on the private EC2 instance and accessible from the backend.  

---

### **Documentation**  

#### **Infrastructure Details**  
1. **VPC**:  
   - Public subnet for the web server.  
   - Private subnet for the database server.  
   - Internet Gateway for public access and NAT Gateway for private instances.  

2. **Security Groups**:  
   - Public SG: Allows SSH (22) and HTTP (80).  
   - Private SG: Restricts MongoDB (27017) access to the public subnet.  

3. **IAM Roles**:  
   - Roles are attached to EC2 instances to securely access AWS services.  

#### **Configuration and Deployment**  
- **Web Server**:  
  - Node.js and Nginx are installed using Ansible.  
  - The React frontend and Express backend are deployed.  
- **Database Server**:  
  - MongoDB is installed and configured with user authentication.  

#### **Scalability**  
- Modify the Terraform configuration to add more EC2 instances for scaling.  
- Future enhancements include load balancing with Nginx.  

#### **Security Hardening**  
- Disable root login for SSH.  
- Restrict access to EC2 instances using security groups.  
```
