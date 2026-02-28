import React from "react";

function Articles({ articles = [] }) {
  console.log("Contenido de article:", articles);
  
  return (
    <div className="bg-gray-100 rounded-lg shadow p-6">
      <table className="min-w-full border border-gray-300">
        <thead className="bg-gray-100">
          <tr>
            <th>Title</th>
            <th>Upvotes</th>
            <th>Date</th>
          </tr>
        </thead>
        <tbody>
          {articles.map((item, index) => {
            return <tr data-testid="article" key="article-index">
              <td className="border border-gray-300 px-4 py-2" data-testid="article-title">{item.title}</td>
              <td className="border border-gray-300 px-4 py-2" data-testid="article-upvotes">{item.upvotes}</td>
              <td className="border border-gray-300 px-4 py-2" data-testid="article-date">{item.date}</td>
            </tr>
          })}
          
        </tbody>
      </table>
    </div>
  );
}

export default Articles;

