# Auto Case Escalation

## 📌 Project Overview

**Auto Case Escalation** is a Salesforce-based automation solution that manages the escalation of `Case` records. The system ensures that any un-escalated cases are automatically escalated once a day, relevant stakeholders are notified, and integration with external systems is triggered for further action.

## 🚀 Features

- **Automated Escalation**: A scheduled batch job runs every day at **12 PM**, identifying `Case` records with the `Escalation Status = "Not Escalated"` and updates them to `"Escalated"`.
- **External System Integration**: For each escalated case, the system sends a REST API call to an external system with case details.
- **Callout Logging**: On successful API call, a **Callout Log** record is created with relevant response and tracking info.
- **Email Notifications**: An email notification is sent when a case is escalated.
- **LWC Component**: Includes a Lightning Web Component with a **"Show Escalated Cases"** button. On click, it displays all escalated cases in a data table.

## 🛠️ Tech Stack

- **Apex** (Batch Apex, Triggers)
- **LWC (Lightning Web Components)**
- **Salesforce Integration** (HTTP Callouts)
- **Salesforce Admin** (Objects, Fields, Flows)

## ⚙️ Installation & Setup

1. **Custom Fields on Case Object**:
   - `Escalation Status` (Picklist: `Not Escalated`, `Escalated`)
   - `Escalation Date` (DateTime) — Auto-populated when a case is escalated.
   - `Create Date` (Date) — Populated using a Flow to mirror the case `CreatedDate`.

2. **Custom Object**: `Callout Log`
   - Fields may include:
     - `Case ID`
     - `Callout Time`
     - `Status`
     - `Response`
     - `Endpoint`

3. **Batch Apex Job**:
   - Schedules to run daily at 12:00 PM.
   - Filters for cases where `Escalation Status = 'Not Escalated'`.
   - Updates escalation status and date.
   - Triggers API call and logs result.

4. **LWC Component**:
   - Add a component with a **"Show Escalated Cases"** button.
   - Displays escalated cases in a lightning data table.

## 📬 Notifications

- When a case is escalated, an email is sent to designated recipients (e.g., case owner, manager, etc.).

## 🧩 Extensibility

- Can be extended to support custom escalation rules based on case priority, customer SLAs, or other criteria.
- API integration can be modified to accommodate different endpoints or payload structures.

## 🤝 Contributing

This is currently an internal project. Contributions are welcome for enhancements, optimizations, or additional integrations. Please create a new branch and submit a pull request.

## 📄 License

*Internal Use Only / Add license info here if open-source (e.g., MIT, Apache 2.0)*

---

