
# ☁️ Terraform AWS Auto Scaling Group Deployment

![Terraform](https://img.shields.io/badge/Terraform-1.0+-7B42BC?style=for-the-badge&logo=terraform)
![AWS](https://img.shields.io/badge/AWS-Cloud-FF9900?style=for-the-badge&logo=amazonaws)
![Apache](https://img.shields.io/badge/Apache-Web_Server-D22128?style=for-the-badge&logo=apache)
![License](https://img.shields.io/badge/License-MIT-green?style=for-the-badge)
![Status](https://img.shields.io/badge/Status-Live-brightgreen?style=for-the-badge)

---

> 🚀 **A fully automated, highly available web infrastructure on AWS — built entirely with Terraform as Infrastructure as Code (IaC).**

---

## 🌟 What Does This Project Do?

This project **automatically provisions** a complete AWS infrastructure with:
- 🖥️ Multiple EC2 instances running Apache web server
- ⚖️ An Auto Scaling Group that self-heals and scales automatically
- 🔒 A Security Group to control traffic
- 🪣 An S3 bucket to store Terraform state remotely

No manual steps. No clicking in the AWS Console. **Just code.**

---

## 🏗️ Architecture
```
                    🌍 Internet
                         │
                         ▼
          ┌──────────────────────────┐
          │      🔒 Security Group    │
          │   ✅ Port 80  (HTTP)      │
          │   ✅ Port 22  (SSH)       │
          └──────────────────────────┘
                         │
                         ▼
┌────────────────────────────────────────────┐
│            ☁️  AWS Default VPC              │
│                                            │
│   ┌─────────────────┐ ┌─────────────────┐ │
│   │  📦 Subnet A    │ │  📦 Subnet B    │ │
│   │  🖥️ EC2 Instance│ │  🖥️ EC2 Instance│ │
│   │  🌐 Apache      │ │  🌐 Apache      │ │
│   └─────────────────┘ └─────────────────┘ │
│                                            │
│   ⚖️  Auto Scaling Group                   │
│   📉 Min: 2  |  📈 Max: 5  | 🎯 desired: 2│
└────────────────────────────────────────────┘
                         │
                         ▼
          ┌──────────────────────────┐
          │      🪣 S3 Bucket         │
          │  📄 terraform.tfstate    │
          │  🔐 Private + Versioned  │
          └──────────────────────────┘
```

---

## ✨ Key Features

| Feature | Description |
|---------|-------------|
| ⚖️ Auto Scaling | Automatically maintains min 2, scales up to 5 instances |
| 🏥 Self Healing | Automatically replaces terminated or unhealthy instances |
| 🌍 High Availability | Instances spread across 2 availability zones |
| 🌐 Apache Web Server | Auto-installed via EC2 user data script at boot |
| 🔒 Security Group | Controls all inbound and outbound traffic |
| 🪣 S3 Remote Backend | Terraform state stored securely in the cloud |
| 🔄 Dynamic AMI | Always fetches the latest Amazon Linux 2 AMI |
| ♻️ Fully Reusable | 100% parameterized with Terraform variables |
| 🚫 Zero Manual Steps | Everything automated — no AWS Console clicking |

---

## 📁 Project Structure
```
📂 Terraform-ASG-Deployment/
│
├── 📄 variable.tf          # All project variables
├── 📄 install_apache.sh    # Apache auto-install script (user data)
├── 📄 asg-sg.tf            # Security Group (HTTP + SSH rules)
├── 📄 asg.tf               # Launch Template + Auto Scaling Group
├── 📄 s3-remote.tf         # S3 bucket + Terraform remote backend
└── 📄 README.md            # Project documentation
```

---

## 🛠️ Tech Stack

| Technology | Usage |
|------------|-------|
| 🟣 Terraform >= 1.0 | Infrastructure as Code |
| 🟠 Amazon Web Services | Cloud Provider |
| 🔴 Apache (httpd) | Web Server |
| 🟡 Amazon Linux 2 | Operating System |
| 🪣 AWS S3 | Remote State Backend |
| 🟢 t2.micro | EC2 Instance Type (Free Tier) |

---

## ⚙️ Prerequisites

- ✅ Terraform >= 1.0 installed
- ✅ AWS CLI installed and configured
- ✅ AWS account with EC2, ASG and S3 permissions

---

## 🚀 Deployment Guide

### 1️⃣ Clone the repository
```bash
git clone https://github.com/donotkg/Terraform-ASG-Deployment.git
cd Terraform-ASG-Deployment
```

### 2️⃣ Initialize Terraform and create the S3 bucket
```bash
terraform init
terraform apply
# Type "yes" to confirm
```

### 3️⃣ Migrate state to the S3 remote backend
Add the backend block in s3-remote.tf then run:
```bash
terraform init -migrate-state
# Type "yes" to confirm migration
terraform apply
```

### 4️⃣ Verify Apache is running 🌐
Open in your browser:
```
http://<INSTANCE_1_PUBLIC_IP>
http://<INSTANCE_2_PUBLIC_IP>
```
✅ You should see: **Hello from ip-xxx-xxx-xxx-xxx**

---

## 🔄 Testing Auto Scaling Self-Healing
```
1. 🖥️  Go to AWS Console → EC2 → Instances
2. ❌  Manually terminate one instance
3. ⏳  Wait 2-3 minutes
4. ✅  A new instance automatically launches
        to maintain the minimum of 2 instances
```
> 💡 This confirms the Auto Scaling Group is **self-healing** and working correctly!

---

## 📊 Infrastructure Summary

| Resource | Configuration |
|----------|--------------|
| 🌐 VPC | Default AWS VPC |
| 📦 Subnets | 2 subnets — 2 availability zones |
| 🖥️ Instance Type | t2.micro (Free Tier eligible) |
| 💿 AMI | Latest Amazon Linux 2 (dynamic) |
| 📉 ASG Minimum | 2 instances |
| 📈 ASG Maximum | 5 instances |
| 🌐 Web Server | Apache on port 80 |
| 🪣 State Backend | AWS S3 with versioning |
| 🔐 Bucket Access | Fully private — no public access |

---

## 🧹 Cleanup

> ⚠️ To avoid unnecessary AWS charges, destroy all resources when done:
```bash
terraform destroy
# Type "yes" to confirm
```

---

## 👤 Author

**Dono**
🐙 GitHub: [@donotkg](https://github.com/donotkg)

---

## 📄 License

This project is open source and available under the [MIT License](LICENSE).

---

⭐ **If you found this project useful, please give it a star!** ⭐
EOF

# Push sur GitHub
git add README.md
git commit -m "Add beautiful README with emojis"
git push
