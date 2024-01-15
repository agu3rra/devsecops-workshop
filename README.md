# DevSecOps Mastery Workshop 🚀

Welcome to the **DevSecOps Mastery Workshop** at SAP! This workshop is designed to challenge your technical skills, creativity, and adaptability in the dynamic field of DevSecOps. Our focus is on your approach and understanding of core concepts, not just the tools you use.

## Important Notes Before You Begin

- **Flexibility in Tools**: While we suggest specific tools like Terraform, Ansible, and AWS Services, feel free to use any tools or technologies that you are comfortable with. It's your understanding of the concepts and your approach to the problem that we are interested in.
- **Use of External Resources**: You are encouraged to use any kind of assistance, including AI tools like ChatGPT, Bard, or resources from the internet. However, we'd like you to rely on these as little as possible, to truly showcase your development skills and problem-solving approach.

## Workshop Objectives 🎯

- **Creativity**: Demonstrate innovative problem-solving and the ability to design custom solutions. We value out-of-the-box thinking and want to see how you tackle new challenges with tools you may not be familiar with.
- **Security**: Implement solutions with a strong focus on security, particularly the principle of least privilege. **Make it secure, make it better.**
- **Adaptability**: Show us how you adapt to new tools, scenarios, and unforeseen challenges.
- **Enjoyment**: Most importantly, have fun! This is a learning experience, and we want you to enjoy the process.

## Duration ⏱️

- **Maximum Time**: **3 Hours**
  - We respect your time and understand you have other commitments. Please do not feel obligated to spend more than 3 hours on this project. Focus on what you're comfortable with and can reasonably achieve within this timeframe.

## IaC Emphasis and Best Practices 🏗️

In this workshop, we place a strong emphasis on using Infrastructure as Code (IaC) for automating and managing your cloud infrastructure. We encourage you to utilize IaC tools to their fullest potential:

- **Maximize IaC Usage**: Strive to provision and configure all aspects of your infrastructure using IaC tools like Terraform or Ansible. This includes servers, networking components, logging mechanisms, and any other resources required for your chosen challenge.

## Challenges 🛠️

### EC2 Log Export to S3 on AWS

In this challenge, you are tasked with setting up an AWS environment to export EC2 instance execution logs to an S3 bucket. This will involve integrating and automating services such as CloudWatch Logs and AWS Lambda, using either AWS CloudFormation, Terraform, or Ansible.

- **EC2 Instance Setup**: Provision an EC2 Linux instance using Terraform/Ansible. Opt for the latest stable version of Ubuntu or CentOS for your instance.
- **CloudWatch Logs Configuration**: Automate the setup of CloudWatch Logs to capture logs from your EC2 instance, ensuring comprehensive log collection.
- **AWS Lambda Function**: Develop an AWS Lambda function in Python or Node.js to process and export logs from CloudWatch Logs to an S3 bucket.
- **IaC for Deployment**:
  - **Option A (AWS CloudFormation)**: Use AWS CloudFormation to automate the deployment of your Lambda function, including the necessary permissions and triggers.
  - **Option B (Terraform/Ansible)**: Alternatively, use Terraform or Ansible to automate the deployment and configuration of your Lambda function and related AWS resources.
- **S3 Bucket Creation**: Automate the creation and configuration of the S3 bucket for log storage using your chosen IaC tool.
- **Security and Networking**: Ensure the network setup, including VPCs, subnets, and security groups, is robust and supports these services securely.

**Note**: This challenge assesses your ability to integrate and automate AWS services effectively using IaC tools. Focus on the efficiency and security of your automation scripts, whether you choose CloudFormation, Terraform, or Ansible.

### Azure Databricks and VM Setup with Blob Log Export on Azure

**Azure Databricks Configuration**
- Automate the setup of Azure Databricks for data analytics and processing.
**Virtual Network (VNET) and VM Setup**
- Provision a VNET for Azure resources using Terraform.
- Spin up an Azure VM within this VNET. Choose a suitable VM size based on the project's requirements.
**Log Export to Azure Blob Storage**
- Configure the system to automatically send logs from the VNET and VM to Azure Blob Storage for centralized logging and analysis.
**Azure Key Vault Integration**
- Use Azure Key Vault to manage secrets and access credentials securely, particularly for accessing Blob Storage.
**Azure Functions and Event Grid Configuration**
- Develop Azure Functions to automate tasks and processes within your Azure environment.
- Integrate Azure Event Grid to manage events and triggers, enhancing the automation of log retrieval and other tasks.
**Log Retrieval Automation**
- Set up a system to automatically retrieve logs from Azure Blob Storage to a preferred location using Azure Functions and Event Grid.
**Infrastructure as Code (IaC) Deployment**
- Automate the deployment of all components (Databricks, VM, Azure Functions, Event Grid, etc.) using Terraform.
**Security and Networking Considerations**
- Ensure robust networking setup, including Network Security Groups (NSGs) and other security measures, following best practices.

## Submission Guidelines 📝

- **Branch Access and Code Submission**:
  - You will find a new branch on our [GitHub repository](https://github.com/devsecops-sap/devsecops-workshop) named after your lastname. Please access this branch to submit your work.
  - Push all your code, scripts, and configuration files to this branch. Ensure that your files are well-organized and clearly commented.

- **Documentation**:
  - Within your branch, create and maintain a detailed `docs` folder.
  - **Project Overview**: Include a brief description of the chosen challenge and your approach.
  - **Technical Details**: Document your architectural decisions, choice of tools, and configurations. Provide explanations for both automated and manual steps, especially where automation wasn't feasible.
  - **Challenges and Solutions**: Discuss any challenges you encountered and how you resolved them.
  - **Security Considerations**: Detail how you have implemented security measures, focusing on the principle of least privilege.

- **Presentation**:
  - Prepare a concise presentation (about 30 minutes) summarizing your project. This can be in the form of a slide deck, placed in the `presentation` folder within your branch.
  - Your presentation should cover the project's architecture, your development process, key learnings, and a demonstration of your code.
  - You will present this to our team, where we'll discuss your approach, your code, and any interesting aspects or challenges you faced.

**Note**: This is your opportunity to showcase not just your technical skills but also your ability to communicate your work effectively. We look forward to understanding your thought process, decision-making, and problem-solving strategies.

**Note**: We encourage clarity and thoroughness in your documentation and presentation. This is your opportunity to showcase not only your technical skills but also your ability to communicate and document your work effectively.

## Bonus Points 🌟

- Display innovation in your solution or approach.
- Emphasize cost-efficiency and maintainability in your design.

## Questions ❓

- For queries or clarifications, open an issue in this repository, and we'll respond promptly.

---

**At SAP, we believe that the most important aspect of our success is our people. We are committed to fostering a culture of innovation, collaboration, and respect, where every individual's contribution is valued and celebrated.**

**Embark on this DevSecOps journey and showcase your expertise! Best of luck, and enjoy the process!** 🌈💻🔐
