(* 

category:      Test
synopsis:      Basic two reactions with three species and parameters both global
               and local to reactions.
componentTags: Compartment, Species, Reaction, Parameter 
testTags:      Amount, LocalParameters
testType:      TimeCourse
levels:        1.2, 2.1, 2.2, 2.3, 2.4, 3.1
generatedBy:   Numeric

The model contains one compartment called "compartment".  There are three
species named S1, S2 and S3 and one global parameter named k.  The model
contains two reactions defined as:

[{width:30em,margin: 1em auto}|  *Reaction*  |  *Rate*  |
| S1 -> S2 | $k * S1 * compartment$  |
| S2 -> S3 | $S1 * S2 * compartment$  |]

Reaction S2 -> S3 defines one local parameter S1.

Note that the id of the local parameter S1 shadows the species S1.  Within
the defining reaction, the value of the locally-defined symbol S1 must be
used.

The initial conditions are as follows:

[{width:30em,margin: 1em auto}|       |*Value*          |*Units*  |
|Initial amount of S1                |$3.0 \x 10^-4$ |mole                      |
|Initial amount of S2                |$            0$ |mole                      |
|Initial amount of S3                |$            0$ |mole                      |
|Value of parameter k                |$            2$ |second^-1^ |
|Value of local parameter S1         |$            1$ |second^-1^ |
|Volume of compartment "compartment" |$            1$ |litre                     |]

The species values are given as amounts of substance to make it easier to
use the model in a discrete stochastic simulator, but (as per usual SBML
principles) their symbols represent their values in concentration units
where they appear in expressions.

*)

newcase[ "00059" ];

addCompartment[ compartment, size -> 1 ];
addSpecies[ S1, initialAmount -> 3.0 10^-4];
addSpecies[ S2, initialAmount -> 0];
addSpecies[ S3, initialAmount -> 0];
addParameter[ k, value -> 2];
addReaction[ S1 -> S2, reversible -> False,
	     kineticLaw -> k * S1 * compartment];
addReaction[ S2 -> S3, reversible -> False,
	     kineticLaw -> S1 * S2 * compartment, parameters -> {S1 -> 1} ];

makemodel[]
