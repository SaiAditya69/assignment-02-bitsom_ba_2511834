## Storage Systems

To meet the four goals of the hospital system, a combination of storage solutions is used.

For patient records and transactional data, a relational database such as PostgreSQL is used. This ensures ACID compliance, which is critical for maintaining accurate and consistent patient information.

For historical data and analytics, a data lakehouse architecture (e.g., S3 with Delta Lake) is used. This allows storage of large volumes of structured and unstructured data, including treatment history, billing data, and ICU logs. It supports both batch processing and analytical queries required for reporting and machine learning.

For real-time ICU vitals, a streaming system like Kafka is used to ingest data continuously into the data lake. This enables near real-time monitoring and storage of high-frequency sensor data.

For enabling natural language queries by doctors, a vector database (such as FAISS or Pinecone) is used. Patient notes and medical documents are converted into embeddings and stored in the vector database, allowing semantic search and retrieval.

---

## OLTP vs OLAP Boundary

The OLTP system consists of the relational database where real-time transactions occur, such as patient admissions, updates to medical records, and billing transactions. This layer is optimized for fast inserts and updates with strict consistency.

The OLAP system begins once data is extracted from the OLTP system and moved into the data lakehouse through ETL pipelines. In this layer, data is transformed, cleaned, and aggregated for analytical purposes. The OLAP system supports reporting dashboards, machine learning models, and long-term analysis.

Thus, the boundary lies at the ETL/streaming layer, where transactional data is replicated and transformed into analytical storage.

---

## Trade-offs

One major trade-off in this architecture is the increased system complexity due to the use of multiple storage systems (relational database, data lakehouse, and vector database). Managing data consistency and synchronization across these systems can be challenging.

To mitigate this, a well-designed data pipeline with clear data governance policies is required. Tools such as workflow orchestration (e.g.,Airflow) can ensure reliable ETL processes, while schema versioning and validation checks can maintain data quality.

Additionally, using a unified data lakehouse reduces duplication between analytical systems, and proper monitoring ensures that all components remain synchronized. This balances flexibility and scalability with manageable complexity.