import axios from 'axios';

const LandingPage = ({ currentUser }) => {
  console.log(currentUser)
  axios.get('/api/user/currentuser');

  return <h1>Landing Page</h1>
}

// LandingPage.getInitialProps = async () => {
// const response = await axios.get('/api/user/currentuser')
//
// console.log('I am in the server');
//
// return response.data;
// };

export default LandingPage;
