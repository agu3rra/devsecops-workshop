# DevSecOps Mastery Workshop 🚀

Welcome to the **DevSecOps Mastery Workshop** at SAP! This workshop is designed to challenge your technical skills, creativity, and adaptability in the dynamic field of DevSecOps. Our focus is on your approach and understanding of core concepts, not just the tools you use.

## Important Notes Before You Begin:

- **Flexibility in Tools**: While we suggest specific tools like Terraform, Ansible, and Splunk, feel free to use any tools or technologies that you are comfortable with. It's your understanding of the concepts and your approach to the problem that we are interested in.
- **Use of External Resources**: You are encouraged to use any kind of assistance, including AI tools like ChatGPT, Bard, or resources from the internet. However, we'd like you to rely on these as little as possible, to truly showcase your development skills and problem-solving approach.

## Workshop Objectives 🎯

- **Creativity**: Demonstrate innovative problem-solving and the ability to design custom solutions. We value out-of-the-box thinking and want to see how you tackle new challenges with tools you may not be familiar with.
- **Security**: Implement solutions with a strong focus on security, particularly the principle of least privilege. **Make it secure, make it better.**
- **Adaptability**: Show us how you adapt to new tools, scenarios, and unforeseen challenges.
- **Enjoyment**: Most importantly, have fun! This is a learning experience, and we want you to enjoy the process.

## Duration ⏱️

- **Maximum Time**: **6 Hours**
  - We respect your time and understand you have other commitments. Please do not feel obligated to spend more than 5 hours on this project. Focus on what you're comfortable with and can reasonably achieve within this timeframe.

## IaC Emphasis and Best Practices 🏗️

In this workshop, we place a strong emphasis on using Infrastructure as Code (IaC) for automating and managing your cloud infrastructure. We encourage you to utilize IaC tools to their fullest potential:

- **Maximize IaC Usage**: Strive to provision and configure all aspects of your infrastructure using IaC tools like Terraform or Ansible. This includes servers, networking components, logging mechanisms, and any other resources required for your chosen challenge.

## Challenges 🛠️

Choose **only one** of the following options for your workshop task. Ensure to showcase your proficiency in network infrastructure and server management alongside the specific requirements of each option.

### Option 1: Splunk Integration on AWS

- **Network Infrastructure**: Use Terraform/Ansible to configure essential AWS network components - VPC, subnets, internet gateway, route tables, and security groups. Ensure the security groups are set up to open only the necessary ports, automating this configuration to align with best security practices.
- **Infrastructure**: Provision two EC2 Linux instances using Terraform/Ansible, ensuring you select the latest available and stable server versions. Recommended distributions are Ubuntu or CentOS.
- **Server Updates**: Configure your IaC scripts to automate server updates, ensuring your instances run the most recent and secure software packages.
- **Splunk Setup**: 
- **Splunk Server**: Manually or optionally through automation, install Splunk on one EC2 instance.
- **Splunk Forwarder**: Automate the installation of the Splunk Universal Forwarder on the second EC2 instance using your IaC tool. Configure it to collect WARN and ERROR logs (`/var/log/syslog` for Ubuntu and `/var/log/messages` for CentOS).
- **Log Management**: Automate the creation of an AWS S3 bucket using Terraform/Ansible and configure the Splunk Server to forward the collected logs to this bucket.
- **Data Analysis**: Utilize AWS Athena to filter out only WARN logs and prepare them for visualization. Consider automating parts of this process if feasible.
- **Visualization**: Develop a dashboard in AWS QuickSight to display these filtered logs. The setup for QuickSight can be manual, but document your process clearly.

**Note**: While automation is key, we understand some aspects might be challenging to automate. Focus on automating as much as possible, but feel free to perform manual steps where necessary, especially for complex configurations like the Splunk Server installation. Please document any manual steps and the reasons behind them.

### Option 2: Kubernetes and Splunk on EKS

- **Network Infrastructure**: Utilize Terraform/Ansible to set up the AWS network infrastructure required for EKS, including VPC, subnets, internet gateway, route tables, and security groups. Automate the configuration of security groups to allow only essential traffic, ensuring optimal security.
- **EKS Cluster**: Deploy a Kubernetes v1.27 cluster on AWS EKS using Terraform/Ansible. Ensure that the cluster deployment is automated and follows the latest security standards and best practices.
- **Cluster Updates**: Include automation for periodic updates and maintenance of your Kubernetes cluster to keep it secure and efficient.
- **Splunk Integration**: Install the latest stable version of Splunk Server in the cluster using Helm. Automate the Splunk setup to the extent possible, ensuring compatibility with Kubernetes v1.27.
- **Logging Architecture**: Implement a DaemonSet with the Splunk Universal Forwarder to collect logs from all worker nodes. This setup should be fully automated using Kubernetes manifests or Helm charts.
- **Log Management**: Automate the creation of an AWS S3 bucket for log storage using Terraform/Ansible and configure Splunk to forward logs to this bucket.
- **Data Analysis and Visualization**: Set up AWS Athena to filter WARN and ERROR logs. Develop visualizations for these logs in AWS QuickSight. While the Athena setup can be automated, the QuickSight configuration may be done manually; document any manual steps clearly.

**Note**: Automation is crucial, but we understand that some aspects of this challenge might require manual intervention. Where automation is not feasible, document your process and rationale for manual configuration, especially in complex setups like Splunk integration and QuickSight visualization.

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
