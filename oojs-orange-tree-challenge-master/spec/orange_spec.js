describe("an orange", function() {
  var orange;

  beforeEach(function() {
    orange = new Orange();
  });

  it("has a diameter between 2.5 and 3.2", function() {
    expect(orange.diameter).not.toBeLessThan(2.5);
    expect(orange.diameter).not.toBeGreaterThan(3.2);
  });
});
