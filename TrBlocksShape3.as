﻿package  {		public class TrBlocksShape3 extends TrAbstractBlocks {		public function TrBlocksShape3() {			// constructor code						var shape1 = [[0, 0, 1],						  [1, 1, 1]];						  			var shape2 = [[1, 0],						  [1, 0],						  [1, 1]];						  			var shape3 = [[1, 1, 1],						  [1, 0, 0]];						  			var shape4 = [[1, 1],						  [0, 1],						  [0, 1]];						  			addShape(shape1);			addShape(shape2);			addShape(shape3);			addShape(shape4);					}	}	}