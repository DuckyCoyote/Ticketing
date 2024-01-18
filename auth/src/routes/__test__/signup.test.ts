import request from 'supertest';
import { app } from '../../app';

it('returns a 201 successful signup', async () => {
  return request(app)
    .post('/api/user/signup')
    .send({
      email: 'test@example.com',
      password: 'password'
    })
    .expect(201)
});

it('returns a 400 with an invalid email', async () => {
  return request(app)
    .post('/api/user/signup').
    send({
      email: 'asdkada',
      password: 'password'
    })
    .expect(400);
});

it('returns a 400 with an invalid password', async () => {
  return request(app)
    .post('/api/user/signup').
    send({
      email: 'test@example.com',
      password: '1'
    })
    .expect(400);
});

it('returns a 400 with an invalid email and password', async () => {
  return request(app)
    .post('/api/user/signup').
    send({
      email: 'asdkada',
      password: 'p'
    })
    .expect(400);
});

it('rerturns a 400 with missing email and password', async () => {
  await request(app)
    .post('/api/user/signup')
    .send({
      email: 'test@example.com'
    })
    .expect(400);

  await request(app)
    .post('/api/user/signup')
    .send({
      password: 'password'
    })
    .expect(400);
});

it('disallows duplicate emails', async () => {
  await request(app)
    .post('/api/user/signup')
    .send({
      email: 'test@example.com',
      password: 'password'
    })
    .expect(201);

  await request(app)
    .post('/api/user/signup')
    .send({
      email: 'test@example.com',
      password: 'password'
    })
    .expect(400);
})

it('sets a cookie after successful signup', async () => {
  const response = await request(app)
    .post('/api/user/signup')
    .send({
      email: 'test@example.com',
      password: 'password'
    })
    .expect(201);

  expect(response.get('Set-Cookie'));
});
