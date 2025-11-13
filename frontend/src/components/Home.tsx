import React, { useState } from "react";

function Home() {
  const [sql, setSql] = useState("");
  const [results, setResults] = useState<any[]>([]);
  const [error, setError] = useState<string | null>(null);

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError(null);
    setResults([]);

    try {
      const res = await fetch("http://localhost:8080/query", {
        method: "POST",
        headers: { "Content-Type": "application/json" },
        body: JSON.stringify({ sql }),
      });

      if (!res.ok) {
        const text = await res.text();
        throw new Error(text);
      }

      const data = await res.json();
      setResults(data);
    } catch (err: any) {
      setError(err.message);
    }
  };

  return (
    <div style={{ maxWidth: 800, margin: "50px auto", textAlign: "center" }}>
      <h1>SQL Query Interface</h1>
      <form onSubmit={handleSubmit}>
        <textarea
          value={sql}
          onChange={(e) => setSql(e.target.value)}
          placeholder="Enter SQL query (e.g., SELECT * FROM STUDENT;)"
          rows={4}
          style={{ width: "100%", padding: "10px" }}
        />
        <br />
        <button type="submit" style={{ padding: "8px 20px", marginTop: "10px" }}>
          Run Query
        </button>
      </form>

      {error && <p style={{ color: "red" }}>Error: {error}</p>}

      {results.length > 0 && (
        <table border={1} style={{ margin: "20px auto", borderCollapse: "collapse" }}>
          <thead>
            <tr>
              {Object.keys(results[0]).map((key) => (
                <th key={key} style={{ padding: "6px 10px" }}>
                  {key}
                </th>
              ))}
            </tr>
          </thead>
          <tbody>
            {results.map((row, i) => (
              <tr key={i}>
                {Object.values(row).map((val, j) => (
                  <td key={j} style={{ padding: "6px 10px" }}>
                    {val as string}
                  </td>
                ))}
              </tr>
            ))}
          </tbody>
        </table>
      )}
    </div>
  );
}

export default Home;

