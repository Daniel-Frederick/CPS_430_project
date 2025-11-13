import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import './App.css'
import Home from "./components/Home.tsx";

function App() {
  return (
    <Router>
      <Routes>
        <Route path="/" element={<Home/>} />
        <Route path="*" element={<h1>Wrong Page</h1>} />
      </Routes>
    </Router>
  )
}

export default App

