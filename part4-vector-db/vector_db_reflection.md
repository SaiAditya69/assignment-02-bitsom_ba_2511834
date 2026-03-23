## Vector DB Use Case

A traditional keyword-based search would not be sufficient for searching large legal documents such as 500-page contracts. Keyword search relies on exact word matching, which means it may miss relevant information if the wording differs. For example, a clause about "termination conditions" may not be retrieved if the user searches for "ending the contract," even though both mean the same thing.

In contrast, a vector database uses embeddings to capture the semantic meaning of text rather than just keywords. By converting both the contract text and the user query into vector representations, the system can identify conceptually similar content even if the exact words differ. This enables more accurate and meaningful search results.

In this system, the contracts would first be broken into smaller chunks (e.g., paragraphs), and embeddings would be generated for each chunk. These embeddings would then be stored in a vector database. When a lawyer enters a query in plain English, it is also converted into an embedding, and the system retrieves the most similar text chunks based on cosine similarity.

This approach allows lawyers to search documents naturally and efficiently, significantly improving productivity. Therefore, a vector database plays a crucial role in enabling semantic search, which is far more powerful than traditional keyword-based retrieval in this context.