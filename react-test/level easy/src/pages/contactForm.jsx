
import { useState } from "react";

 
function ContactForm() {
  const [name, setName] = useState("");
  const [email, setEmail] = useState("");
  const [message, setMessage] = useState("");
  const [submittedData, setSubmittedData] = useState(null);
  const [error, setError] = useState("");

  const handleSubmit = (e) => {
    e.preventDefault();
    setError("")
    if (!name.trim() || !email.trim() || !message.trim()){
      setError("All fields are required.");
      setSubmittedData("")
      return;
    }    
    setSubmittedData({ name, email, message });
    setName("")
    setEmail("")
    setMessage("")
  };

  return (
    <>
      <p className="mb-4 font-semibold text-lg">The form will be validated when the user click the button </p>
      <div className="">
        <h1>Contact Form</h1>
        <form onSubmit={handleSubmit}>
          <input
            type="text"
            value={name}
            onChange={(e) => setName(e.target.value)}
            placeholder="Name"
            data-testid="name-input"
            className="w-full px-4 py-2 my-2 border border-gray-300 shadow-sm rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          />
          <input
            type="email"
            value={email}
            onChange={(e) => setEmail(e.target.value)}
            placeholder="Email"
            data-testid="email-input"
            className="w-full px-4 py-2 my-2 border border-gray-300 shadow-sm rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          />
          <textarea
            value={message}
            onChange={(e) => setMessage(e.target.value)}
            placeholder="Message"
            data-testid="message-input"
            className="w-full px-4 py-2 my-2 border border-gray-300 shadow-sm rounded-lg focus:outline-none focus:ring-2 focus:ring-blue-500 focus:border-blue-500"
          />
          <button 
            type="submit"
            data-testid="submit-button"
            className="px-4 py-2 mt-4 bg-blue-600 text-white rounded-lg"
          >
            Submit
          </button>
        </form>
        {error && (
          <p 
            data-testid="error-message" 
            className="mt-5"
          >
            {error}
          </p>
        )}
        {submittedData && (
          <div
            data-testid="submitted-data"
            className="mt-5"
          >
            <h2>Submitted Information</h2>
            <p>
              <strong>Name:</strong> {submittedData.name}
            </p>
            <p>
              <strong>Email:</strong> {submittedData.email}
            </p>
            <p>
              <strong>Message:</strong> {submittedData.message}
            </p>
          </div>
        )}
      </div>
    </>
  );
}

export default ContactForm;
