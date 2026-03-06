import { useState } from 'react'

import { ARTICLES_DATA } from "../constants";
import Articles from "../components/Articles";


function SortingArticles() {

  const a  = [...ARTICLES_DATA];
  a.sort((x,y) => y.upvotes - x.upvotes);
  const [localArticles, setLocalArticles] = useState(a);

  const handleMostUpvoted = () => {
    const auxArticles = [...localArticles]; 
    auxArticles.sort((a, b) => b.upvotes - a.upvotes);
    setLocalArticles(auxArticles);
  };

  const handleMostRecent = () => {
    const auxArticles = [...localArticles]; 
    auxArticles.sort((a, b) => new Date(b.date) - new Date(a.date));
    setLocalArticles(auxArticles);
  };

  return (

    <div className="">
      <div className="p-6 mb-5">
        <p className="mb-4 font-semibold text-lg">Order by clicking the some button</p>
        <label className="p-6 pl-0">
          Sort By
        </label>
        <button
          className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition"
          onClick={handleMostUpvoted}
        >
          Most Upvoted
        </button>
        <button
          className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition"
          onClick={handleMostRecent}
        >
          Most Recent
        </button>
      </div>
      <Articles articles={localArticles} />
    </div>
  )
}

export default SortingArticles;