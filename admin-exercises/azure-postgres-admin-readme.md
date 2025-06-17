
# Azure PostgreSQL Admin Exercises

> Thư mục này chứa các bài tập nâng cao giúp luyện kỹ năng quản trị Azure Database for PostgreSQL cho vai trò DBA chuyên nghiệp.

## 📁 Danh sách bài tập

### 01. High Availability & Failover Simulation
**Mục tiêu**: Cấu hình HA và kiểm thử failover trên Azure PostgreSQL Flexible Server.

**Yêu cầu:**
- Tạo PostgreSQL Flexible Server với Zone-Redundant HA.
- Cài client đơn giản (Flask app / psql loop query).
- Giả lập sự cố vùng để trigger failover.
- Ghi lại downtime, recovery time, dữ liệu có bị mất hay không.

📂: `admin-exercises/01-ha-failover/`

---

### 02. Performance Tuning & Query Optimization
**Mục tiêu**: Sử dụng công cụ thống kê để tối ưu truy vấn SQL chậm.

**Yêu cầu:**
- Bật Query Store, pg_stat_statements.
- Import dữ liệu mẫu (DVD Rental / TPC-H).
- Viết truy vấn chậm → dùng EXPLAIN ANALYZE → cải tiến hiệu năng.

📂: `admin-exercises/02-query-optimization/`

---

### 03. Backup Verification & Point-in-Time Restore (PITR)
**Mục tiêu**: Khôi phục dữ liệu về thời điểm cụ thể.

**Yêu cầu:**
- Tạo backup tự động (built-in).
- Thêm dữ liệu tại thời điểm T.
- Restore về T - 5 phút → xác nhận dữ liệu rollback thành công.
- So sánh PITR vs Full Restore.

📂: `admin-exercises/03-backup-restore-pitr/`

---

### 04. Monitoring & Alerting with Azure Monitor
**Mục tiêu**: Cấu hình giám sát & cảnh báo thông minh.

**Yêu cầu:**
- Enable Diagnostic Settings → Log Analytics.
- Viết KQL để kiểm tra:
  - Số lượng connection.
  - Deadlocks.
  - Long-running queries.
- Tạo Alert khi:
  - CPU > 80%
  - Connection vượt 90%
  - Disk latency > 20ms

📂: `admin-exercises/04-monitor-alerts/`

---

### 05. Security Hardening & Compliance
**Mục tiêu**: Bảo mật kết nối, phân quyền đúng chuẩn least privilege.

**Yêu cầu:**
- Bắt buộc SSL/TLS.
- Firewall chỉ cho phép IP cụ thể.
- Tạo user phân quyền giới hạn.
- Bật audit query logs.
- Tổng hợp log truy cập & hoạt động người dùng.

📂: `admin-exercises/05-security-hardening/`

---

## ✅ Yêu cầu nền tảng:
- Kiến thức tốt về PostgreSQL (5+ năm kinh nghiệm)
- Quen thuộc Azure Portal, CLI, Terraform (nếu dùng automation)
- Kỹ năng truy vấn SQL nâng cao, phân tích hiệu năng, bảo mật

---

## 📌 Gợi ý mở rộng
- Tự động hóa backup restore qua Terraform/CLI
- Viết script validate HA failover (downtime monitor)
- Tích hợp giám sát PostgreSQL với Grafana/Prometheus (qua exporter)
