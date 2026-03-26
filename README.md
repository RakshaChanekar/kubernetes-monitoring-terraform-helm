# 🚀 Deploy Prometheus & Grafana on Kubernetes using Terraform & Helm

## 📌 Project Title

**Deploy Prometheus and Grafana on Kubernetes Cluster using Terraform & Helm**

---

## 🧠 Scenario

The Kubernetes team faced challenges in monitoring cluster health and application performance.

To address this, the SRE team implemented a **centralized monitoring solution** using:

* Prometheus for metrics collection
* Grafana for visualization
* Terraform & Helm for automation
---

## 🎯 Objectives

* Provision Kubernetes infrastructure using Terraform
* Deploy Prometheus and Grafana using Helm
* Enable real-time monitoring of cluster resources
* Apply Infrastructure as Code best practices

---

## 🏗️ Architecture
<img width="1024" height="1536" alt="image" src="https://github.com/user-attachments/assets/63723596-9efd-485a-b072-cd0c56dfe1f6" />

```
## ⚙️ Technology Stack

| Category        | Tools Used       |
| --------------- | ---------------- |
| Cloud Platform  | AWS EKS          |
| IaC Tool        | Terraform        |
| Package Manager | Helm             |
| Monitoring      | Prometheus       |
| Visualization   | Grafana          |
| CLI Tools       | kubectl, AWS CLI |

---

## 📁 Project Structure

```id="structure"
monitoring-project/
│
├── main.tf                  # EKS cluster provisioning
├── helm_monitoring.tf       # Prometheus & Grafana deployment
├── variables.tf             # Input variables
├── outputs.tf               # Outputs
└── README.md                # Documentation
```

---

## 🚀 Deployment Workflow

### 1️⃣ Provision Kubernetes Cluster

```bash id="step1"
terraform init
terraform apply
```

---

### 2️⃣ Configure Cluster Access

```bash id="step2"
aws eks update-kubeconfig --region us-east-1 --name monitoring-cluster
```

Verify:

```bash id="step3"
kubectl get nodes
```

---

### 3️⃣ Setup Helm Repositories

```bash id="step4"
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
```

---

### 4️⃣ Deploy Monitoring Stack (Terraform + Helm)

```bash id="step5"
terraform apply
```

---

## 🔍 Verification

```bash id="verify1"
kubectl get pods -n monitoring
```

Expected:

```id="verify2"
prometheus-server            Running
prometheus-node-exporter     Running
grafana                      Running
```

---

## 🌐 Access Services

### 🔹 Prometheus

```bash id="prom"
kubectl port-forward svc/prometheus-server 9090:80 -n monitoring
```

👉 http://localhost:9090

---

### 🔹 Grafana

```bash id="graf"
kubectl port-forward svc/grafana 3000:80 -n monitoring
```

👉 http://localhost:3000

**Credentials:**

```id="cred"
Username: admin  
Password: admin123
```

---

## 🔗 Grafana Integration

* Navigate to **Settings → Data Sources**
* Add **Prometheus**
* Use URL:

```id="prom-url"
http://prometheus-server.monitoring.svc.cluster.local
```

---

## 📊 Dashboard Setup

* Go to **Dashboards → Import**
* Use Dashboard ID: `1860`

---

## 📸 Deliverables

* ✔ Running Pods (`kubectl get pods -n monitoring`)
  <img width="940" height="616" alt="image" src="https://github.com/user-attachments/assets/9ca44e13-4f4a-4545-8092-bb88682f23af" />

* ✔ Prometheus UI
  <img width="940" height="496" alt="image" src="https://github.com/user-attachments/assets/c7451402-1807-4933-9a5b-aef41a5fc0fa" />

* ✔ Grafana Dashboard
  <img width="940" height="494" alt="image" src="https://github.com/user-attachments/assets/bcbd40cc-3b35-4039-b16c-cf51a46b8be4" />


---

## 🚀 Key Features

* Automated infrastructure provisioning using Terraform
* Helm-based Kubernetes deployments
* Lightweight and efficient monitoring stack
* Real-time cluster observability

---

## 🎯 Benefits

* Infrastructure as Code (IaC)
* Reproducible deployments
* Scalable architecture
* Reduced manual intervention

---

## 🔮 Future Enhancements

* Integrate Alertmanager
* Add Ingress Controller
* Monitor custom applications
* CI/CD pipeline integration

---

## 👨‍💻 Author

**Raksha Chanekar**

---

## ⭐ Support

If you found this project useful, consider giving it a ⭐ on GitHub!
