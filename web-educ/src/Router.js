import { createBrowserRouter } from "react-router-dom";
import SignUp from "./pages/Authentication/SignUp";
import SignIn from "./pages/Authentication/SignIn";

const router = createBrowserRouter([
    {
        path: '/',
        element: <SignUp />
    },

    {
        path: '/SignIn',
        element: <SignIn />
    },
])

export default router