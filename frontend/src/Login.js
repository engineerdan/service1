import {useContext, useState} from "react"
import { signIn } from "./auth"
import {AuthContext} from "./AuthContext";
import {Link, Navigate} from "react-router-dom";

export default function Login() {
    const [username, setUsername] = useState("")
    const [password, setPassword] = useState("")
    const [error, setError] = useState("")

    const { user, signIn } = useContext(AuthContext)

    const handleSubmit = async (e) => {
        e.preventDefault()
        setError("")

        try {
            await signIn(username, password)
            // Redirect to the app's main page or dashboard
        } catch (err) {
            setError(err.message)
        }
    }

    // If the user is logged in, don't show the login form
    if (user) {
        // Redirect to the profile page
        return <Navigate to="/profile" />
    }

    return (
        <div>
            <h2>Login</h2>
            <form onSubmit={handleSubmit}>
                <input
                    type="text"
                    placeholder="Username"
                    value={username}
                    onChange={(e) => setUsername(e.target.value)}
                />
                <input
                    type="password"
                    placeholder="Password"
                    value={password}
                    onChange={(e) => setPassword(e.target.value)}
                />
                <button type="submit">Login</button>
            </form>
            {error && <p>{error}</p>}
            <Link to="/forgot-password">Forgot Password</Link>
        </div>
    )
}