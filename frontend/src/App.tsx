import { BrowserRouter as Router, Routes, Route } from "react-router-dom";
import './App.css'
import Home from "./Home";

function App() {
  return (
    <Router>
      <Header />
      <Routes>
        <Route path="/" element={<Home/>} />
        <Route path="*" element={<h1>Wrong Page</h1>} />
      </Routes>
    </Router>
  )
}

export default App

