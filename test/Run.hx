package;

import bt.decorators.*;
import bt.Status;
import bt.BehaviorTree;
import bt.composites.*;

using buddy.Should;

class Run extends buddy.SingleSuite {

    public function new() {
        describe("Behavior Tree", {

            describe("with 2 sec Timer", {

                var bt1 = new BehaviorTree(
                    new Sequence([
                        new Timer("Timer", 2.0),
                        new Condition("Action", true)
                    ])
                );

                var bb1 = new SpecBlackboard();

                it("should be Running after 1 sec", {
                    var result = bt1.update(bb1, 1.0);
                    result.should.be(Status.Running);
                });

                it("should be Success after 2 sec", {
                    var result = bt1.update(bb1, 1.0);
                    result.should.be(Status.Success);
                });

                it("should have at the end last behavior titled Action", {
                    bb1.last.should.be("Action");
                });

            });

            describe("of ABC conditions where success one is B", {

                var bt = new BehaviorTree(
                    new ContinuousPriority([
                        new ContinuousSequence([
                            new Condition("A check (1/2)", true),
                            new Condition("A check (2/2)", false),
                            new Timer("A", 1.0),
                            new Succeeder(new Condition("A complete", false)),
                        ]),
                        new ContinuousSequence([
                            new Condition("B check (1/2)", true),
                            new Condition("B check (2/2)", true),
                            new Timer("B", 1.0),
                            new Succeeder(new Condition("B complete", false)),
                        ]),
                        new ContinuousSequence([
                            new Condition("C check (1/2)", true),
                            new Condition("C check (2/2)", true),
                            new Timer("C", 1.0),
                            new Succeeder(new Condition("C complete", false)),
                        ]),
                    ])
                );

                var bb = new SpecBlackboard();

                describe("after 1st update with dt is 0", {

                    it("should be Running", {
                        var result = bt.update(bb, .0);
                        result.should.be(Status.Running);
                    });
                    it("should select B", {
                        bb.last.should.be("B");
                    });
                    it("should have correct way log", {
                        bb.log.should.be("A check (1/2),A check (2/2),B check (1/2),B check (2/2),B,");
                    });

                });

                describe("after 2nd update with dt is 0", {

                    it("should be Running", {
                        var result = bt.update(bb, .0);
                        result.should.be(Status.Running);
                    });
                    it("should select B", {
                        bb.last.should.be("B");
                    });
                    it("should have correct way log", {
                        bb.log.should.be("A check (1/2),A check (2/2),B check (1/2),B check (2/2),B,B,");
                    });

                });

                describe("after 3rd update", {

                    it("should be Success", {
                        var result = bt.update(bb, 1.0);
                        result.should.be(Status.Success);
                    });
                    it("should complete B", {
                        bb.last.should.be("B complete");
                    });
                    it("should have correct way log", {
                        bb.log.should.be("A check (1/2),A check (2/2),B check (1/2),B check (2/2),B,B,B,B complete,");
                    });

                });

                describe("after 4th update", {

                    it("should be Success", {
                        var result = bt.update(bb, 1.0);
                        result.should.be(Status.Success);
                    });
                    it("should complete B", {
                        bb.last.should.be("B complete");
                    });
                    it("should have correct way log", {
                        bb.log.should.be("A check (1/2),A check (2/2),B check (1/2),B check (2/2),B,B,B,B complete,A check (1/2),A check (2/2),B check (1/2),B check (2/2),B,B complete,");
                    });

                });

            });

            describe("of composite combinations", {

                var bt = new BehaviorTree(
                    new Priority([

                        new Failer(new Condition("Everytime check", true)),

                        new ContinuousPriority([
                            new Sequence([
                                new Condition("A check (1/2)", true),
                                new Condition("A check (2/2)", false),
                                new ContinuousSequence([
                                    new Timer("A", 1.0),
                                    new Succeeder(new Condition("A complete", false)),
                                ])
                            ]),
                            new Sequence([
                                new Condition("B check (1/2)", true),
                                new Condition("B check (2/2)", true),
                                new ContinuousSequence([
                                    new Timer("B", 1.0),
                                    new Succeeder(new Condition("B complete", false)),
                                ])
                            ]),
                            new Sequence([
                                new Condition("C check (1/2)", true),
                                new Condition("C check (2/2)", true),
                                new ContinuousSequence([
                                    new Timer("C", 1.0),
                                    new Succeeder(new Condition("C complete", false)),
                                ])
                            ]),
                        ])

                    ])
                );

                var bb = new SpecBlackboard();

                describe("after 1st update", {

                    it("should be Running", {
                        var result = bt.update(bb, .5);
                        result.should.be(Status.Running);
                    });
                    it("should select B", {
                        bb.last.should.be("B");
                    });
                    it("should have correct way log", {
                        bb.log.should.be("Everytime check,A check (1/2),A check (2/2),B check (1/2),B check (2/2),B,");
                    });

                });

                describe("after 2nd update", {

                    it("should be Success", {
                        var result = bt.update(bb, .5);
                        result.should.be(Status.Success);
                    });
                    it("should complete B", {
                        bb.last.should.be("B complete");
                    });
                    it("should have correct way log", {
                        bb.log.should.be("Everytime check,A check (1/2),A check (2/2),B check (1/2),B check (2/2),B,Everytime check,B check (1/2),B check (2/2),B,B complete,");
                    });

                });

                describe("after 3rd update", {

                    it("should be Running", {
                        var result = bt.update(bb, .5);
                        result.should.be(Status.Running);
                    });
                    it("should select B", {
                        bb.last.should.be("B");
                    });
                    it("should have correct way log", {
                        bb.log.should.be("Everytime check,A check (1/2),A check (2/2),B check (1/2),B check (2/2),B,Everytime check,B check (1/2),B check (2/2),B,B complete," + 
                                         "Everytime check,A check (1/2),A check (2/2),B check (1/2),B check (2/2),B,");
                    });

                });

                describe("after 4th update", {

                    it("should be Success", {
                        var result = bt.update(bb, .5);
                        result.should.be(Status.Success);
                    });
                    it("should complete B", {
                        bb.last.should.be("B complete");
                    });
                    it("should have correct way log", {
                        bb.log.should.be("Everytime check,A check (1/2),A check (2/2),B check (1/2),B check (2/2),B,Everytime check,B check (1/2),B check (2/2),B,B complete," + 
                                         "Everytime check,A check (1/2),A check (2/2),B check (1/2),B check (2/2),B,Everytime check,B check (1/2),B check (2/2),B,B complete,");
                    });

                });

            });

        });
    }

}