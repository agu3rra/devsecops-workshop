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

### Option 1: EC2 Log Export to S3 on AWS

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

## Submission Guidelines 📝

- **Create a Personal Repository**: Start by creating a new repository on GitHub for your project. This repository can be private. Once completed, grant access to our team by adding our GitHub usernames as collaborators.
  
- **Documentation**: In your repository, maintain a detailed `docs` folder. Your documentation should include:
- **Project Overview**: A brief description of the chosen challenge and your approach.
- **Technical Details**: Document your architectural decisions, choice of tools, and configurations. Include explanations for both automated and manual steps, especially where automation wasn't feasible.
- **Challenges and Solutions**: Discuss any challenges you encountered and how you resolved them.
- **Security Considerations**: Explain how you implemented security measures, focusing on the principle of least privilege.
- **Future Improvements**: Ideas or plans for enhancing the project if given more time or resources.

- **Code and Configuration**: Ensure all your code, scripts, and configuration files are well-commented and organized in the repository.

- **Presentation**: Prepare a brief presentation (can be a slide deck in the `presentation` folder of your repository) summarizing your project. You will be presenting this to our team, focusing on the architecture, your development process, and key learnings.

- **Final Submission**: Once your project is complete, ensure all your work is pushed to your GitHub repository. Then, email us the link to your repository along with a request to access it.

**Note**: We encourage clarity and thoroughness in your documentation and presentation. This is your opportunity to showcase not only your technical skills but also your ability to communicate and document your work effectively.

## Bonus Points 🌟

- Display innovation in your solution or approach.
- Emphasize cost-efficiency and maintainability in your design.

## Questions ❓

- For queries or clarifications, open an issue in this repository, and we'll respond promptly.

---

**At SAP, we believe that the most important aspect of our success is our people. We are committed to fostering a culture of innovation, collaboration, and respect, where every individual's contribution is valued and celebrated.**

**Embark on this DevSecOps journey and showcase your expertise! Best of luck, and enjoy the process!** 🌈💻🔐
