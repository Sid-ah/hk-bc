describe("a bike station", function() {
  var station, newerBike, olderBike, bikes

  beforeEach(function() {
    newerBike = new Bike("12345", "red", 2016);
    olderBike = new Bike("67890", "blue", 2015);

    station = new Station("Divvy", "Wood & Division", [newerBike, olderBike])
  });

  it("has a name", function() {
    expect(station.name).toEqual("Divvy");
  });

  it("has a location", function() {
    expect(station.location).toEqual("Wood & Division");
  });

  it("has bikes", function() {
    expect(station.bikes).toEqual([newerBike, olderBike]);
  });

  it("is empty if it has no bikes", function() {
    station.bikes = [];
    expect(station.empty()).toBe(true);
  });

  it("has a newest bike determined by model year", function() {
    expect(station.newestBike()).toEqual(newerBike);
  });

  describe("adding bikes", function() {
    it("takes bikes one at a time", function() {
      station.bikes = [];
      station.take(newerBike);
      expect(station.bikes).toEqual([newerBike]);
    });

    it("takes multiple bikes at the same time", function() {
      bike = { id: "4567", color: "red", modelYear: 2010 }
      station.bikes = [bike]

      station.takeMultiple([newerBike, olderBike]);
      expect(station.bikes).toEqual([bike, newerBike, olderBike]);
    });
  });

  describe("releasing bikes", function() {
    it("releases its newest bike", function() {
      expect(station.release()).toEqual(newerBike);
    });

    it("does not keep released bikes", function() {
      expect(station.bikes).toContain(newerBike);
      station.release();
      expect(station.bikes).not.toContain(newerBike);
    });

    describe("when the station is empty", function() {
      it("releases nothing", function() {
        station.bikes = [];
        expect(station.release()).toBeUndefined();
      });
    });
  });
});
