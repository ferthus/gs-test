import { useState } from 'react'
import reactLogo from './assets/react.svg'
import viteLogo from '/vite.svg'
import Articles from "./components/Articles";


function App({articles}) {

  const a  = [...articles];
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

    <div className="min-h-screen">
        <div className="bg-gray-100 rounded-lg shadow p-6 mb-5">
          <label className="text-lg font-semibold p-6">
            Sort By
          </label>
          <button
            data-testid="most-upvoted-link"
            className="px-4 py-2 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition"
            onClick={handleMostUpvoted}
          >
            Most Upvoted
          </button>
          <button
            data-testid="most-recent-link"
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

export default App
