(* 

category:      Test
synopsis:      Basic reaction with two species in a compartment 
               where the species have only substance units.
componentTags: Compartment, Species, Reaction, Parameter 
testTags:      Amount, HasOnlySubstanceUnits
testType:      TimeCourse
levels:        2.1, 2.2, 2.3, 2.4, 3.1
generatedBy:   Numeric

The model contains one compartment called "compartment".  There are three
species named S1, S2 and S3 and two parameters named k1 and k2.  The model
contains two reactions defined as:

[{width:30em,margin: 1em auto}|  *Reaction*  |  *Rate*  |
| S1 + S2 -> S3 | $k1 * S1 * S2$  |
| S3 -> S1 + S2 | $k2 * S3$  |]

The initial conditions are as follows:

[{width:30em,margin: 1em auto}|       |*Value*         |*Units*  |
|Initial amount of S1                |$1.0 \x 10^-3$ |mole                      |
|Initial amount of S2                |$2.0 \x 10^-3$ |mole                      |
|Initial amount of S3                |$1.0 \x 10^-3$ |mole                      |
|Value of parameter k1               |$ 1.7 \x 10^1$ |litre mole^-1^ second^-1^ |
|Value of parameter k2               |$          0.3$ |second^-1^ |
|Volume of compartment "compartment" |$            1$ |litre                     |]

The species have been declared as having substance units only. Thus, they 
must be treated as amounts where they appear in expressions.

*)

newcase[ "00061" ];

addCompartment[ compartment, size -> 1 ];
addSpecies[ S1, initialAmount -> 1.0 10^-3, hasOnlySubstanceUnits->True ];
addSpecies[ S2, initialAmount -> 2.0 10^-3, hasOnlySubstanceUnits->True ];
addSpecies[ S3, initialAmount -> 1.0 10^-3, hasOnlySubstanceUnits->True ];
addParameter[ k1, value -> 1.7 10^1 ];
addParameter[ k2, value -> 0.3 ];
addReaction[ S1 + S2 -> S3, reversible -> False,
	     kineticLaw -> k1 * S1 * S2 ];
addReaction[ S3 -> S1 + S2, reversible -> False,
	     kineticLaw -> k2 * S3 ];

makemodel[]
