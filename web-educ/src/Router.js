import { createBrowserRouter } from "react-router-dom";
import SignUp from "./pages/Authentication/SignUp";
import SignIn from "./pages/Authentication/SignIn";
import Quiz from "./pages/QuizUI/quiz";

const router = createBrowserRouter([
    {
        path: '/',
        element: <SignUp />
    },
    {
        path: '/SignIn',
        element: <SignIn />
    },
    {
        path: '/quiz', // New path for the quiz component
        element: <Quiz />
    },
])

export default router