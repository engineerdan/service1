import {BrowserRouter, BrowserRouter as Router, Link, Route, Routes} from "react-router-dom"
import SignUp from "./SignUp"
import ConfirmSignUp from "./ConfirmSignUp";
import Login from "./Login";
import Profile from "./UserProfile";
import {AuthContext, AuthProvider} from "./AuthContext"
import RouteGuard from "./RouteGuard";
import {useContext} from "react";
import ForgotPassword from "./ForgotPassword";
import ResetPassword from "./ResetPassword";

function Navigation() {
    const { user } = useContext(AuthContext)

    return (
        <nav>
            <ul>
                <li>
                    <Link to="/">Home</Link>
                </li>
                {user ? (
                    <>
                        <li>
                            <Link to="/profile">Profile</Link>
                        </li>
                    </>
                ) : (
                    <li>
                        <Link to="/login">Login</Link>
                    </li>
                )}
            </ul>
        </nav>
    )
}

function App() {
  return (
      <AuthProvider>
          <BrowserRouter>
              <Navigation />
              <main>
                  <Routes>
                      <Route path="/signUp" element={<SignUp />} />
                      <Route path="/confirm-sign-up" element={<ConfirmSignUp />} />
                      <Route path="/login" element={<Login />} />
                      <Route path="/profile" element={<RouteGuard> <Profile /> </RouteGuard>} />
                      <Route path="/forgot-password" element={<ForgotPassword />} />
                      <Route path="/reset-password" element={<ResetPassword />} />
                      {/* Add other routes here */}
                  </Routes>
              </main>
          </BrowserRouter>
      </AuthProvider>
  )
}

export default App