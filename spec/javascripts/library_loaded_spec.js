describe("Check libraries", function() {
  it("jQuery loaded", function() {
    expect(jQuery).toBeDefined();
  });

  it("Vue.js loaded", function() {
    expect(Vue).toBeDefined();
  });
});
