fixture('test').page(`http://localhost:3000/?showLogin`);

test('initial', async t => {
  await t.expect('ok').eql('ok');
});
