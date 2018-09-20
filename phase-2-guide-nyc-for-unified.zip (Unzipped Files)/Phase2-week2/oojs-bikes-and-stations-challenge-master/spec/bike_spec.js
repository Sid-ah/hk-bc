describe("a bike", function() {
  var bike;

  beforeEach(function() {
    bike = new Bike(12847390, "red", 2016)
  });

  it("has an id number", function() {
    expect(bike.id).toEqual(12847390);
  });

  it("has a color", function() {
    expect(bike.color).toEqual("red");
  });

  it("has a model year", function() {
    expect(bike.modelYear).toEqual(2016);
  });
});
