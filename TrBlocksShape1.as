﻿package  {		public class TrBlocksShape1 extends TrAbstractBlocks {		public function TrBlocksShape1(gameData: ITrGameData) {						setGameData(gameData);						// constructor code						var shape1 = [[1, 1],						  [1, 0],						  [1, 0]];						  			var shape2 = [[1, 1, 1],						  [0, 0, 1]];						  			var shape3 = [[0, 1],						  [0, 1],						  [1, 1]];						  			var shape4 = [[1, 0, 0],						  [1, 1, 1]];						  			addShape(shape1);			addShape(shape2);			addShape(shape3);			addShape(shape4);		}	}	}