import { StrictMode } from 'react'
import { createRoot } from 'react-dom/client'
import './index.css'
import App from './App.jsx'

import { ARTICLES_DATA } from "./constants";

createRoot(document.getElementById('root')).render(
  <StrictMode>
    <App articles={ARTICLES_DATA}/>
  </StrictMode>,
)
