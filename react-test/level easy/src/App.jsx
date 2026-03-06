import { BrowserRouter, Routes, Route } from "react-router-dom"
import { Link } from "react-router-dom"
import Home from "./pages/home"
import SortingArticles from "./pages/sorting"
import ContactForm from "./pages/contactForm"

function App() {
  return (
    <BrowserRouter>
      <div className="max-w-7xl mx-auto grid grid-rows-[auto_1fr] h-screen gap-4 p-4">
        <div className="bg-white shadow rounded-lg p-4 max-h-[200px] overflow-auto">
          <nav className="p-5">
            <Link
              className="px-4 py-2 mx-2 bg-blue-600 text-white rounded-lg"
              to="/"
            >
              Home
            </Link>
            <Link
              className="px-4 py-2 mx-2 bg-blue-600 text-white rounded-lg"
              to="/sorting-articles"
            >
              Sorting a list of articles
            </Link>
            <Link
              className="px-4 py-2 mx-2 bg-blue-600 text-white rounded-lg"
              to="/contact-form"
            >
              Contact Form
            </Link>
          </nav>
        </div>
        <div className="bg-white shadow rounded-lg p-4">
          <Routes>
            <Route path="/" element={<Home />} />
            <Route path="/sorting-articles" element={<SortingArticles />} />
            <Route path="/contact-form" element={<ContactForm />} />
            
          </Routes>
        </div>
      </div>
    </BrowserRouter>
  )
}

export default App
