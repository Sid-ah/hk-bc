var Orange = function() {
  this.diameter = this.calculateDiameter();
}

Orange.prototype.minOrangeDiameter = 2.5;
Orange.prototype.maxOrangeDiameter = 3.2;

Orange.prototype.calculateDiameter = function() {
  return (Math.random() * (this.maxOrangeDiameter - this.minOrangeDiameter)) + this.minOrangeDiameter;
}
