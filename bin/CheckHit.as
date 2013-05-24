package  
{
	import flash.display.MovieClip;
	
	public class CheckHit extends MovieClip
	{
		public static var maxEnemy: int = 30 + Math.round(Math.random()*30);
		public static var countEnemies: int;

		// Функция проверяет положение игрока и врагов на сцене
		public static function checkHitPlayer(_currentBall: MovieClip, user: MovieClip, arr: int):void
		{
			for (var i: Number = 0; i < arr; i++)
			{
				var dx: Number = _currentBall.x - user.x; // расстояние между шариками по Х
				var dy: Number = _currentBall.y - user.y; // расстояние между шариками по Y
				var dist: Number = Math.sqrt(dx*dx + dy*dy); // Дистанция между шариками
				var minDist: Number = user.width/2 + _currentBall.width/2; // Минимальная нужная дистанция между шариками
					
					// Если дистанция меньше суммы радиусов проверяемых шариков, то передвигаем 
					// проверяемый шарик на половину его радиуса
					if (dist < minDist)
					{
						var ang: Number = Math.atan2(_currentBall.y - user.y, _currentBall.x - user.x);
						_currentBall.x = Math.cos(ang) + ((dist - minDist)/2) + 10;
						_currentBall.y = Math.sin(ang) + ((dist - minDist)/2) + 10;
					}
			}
			i = 0;
		}
		
		// Функция проверяет положение врагов на сцене
		public static function checkHitEnemy(i: Number, _currentEnemy: MovieClip, Enemys: Array):void
		{
			var j: int = 0;
				for (j; j < i; j++)
				{
					var etalonBall = Enemys[j];
					var dx: Number = _currentEnemy.x - etalonBall.x; // расстояние между шариками по Х
					var dy: Number = _currentEnemy.y - etalonBall.y; // расстояние между шариками по Y
					var dist: Number = Math.sqrt(dx*dx + dy*dy); // Дистанция между шариками
					var minDist: Number = etalonBall.width/2 + _currentEnemy.width/2; // Минимальная нужная дистанция между шариками
					
					// Если дистанция меньше суммы радиусов проверяемых шариков, то передвигаем 
					// проверяемый шарик на половину его радиуса
					if (dist < minDist)
					{
						var ang: Number = Math.atan2(_currentEnemy.y - etalonBall.y, _currentEnemy.x - etalonBall.x);
						_currentEnemy.x = Math.cos(ang) + ((dist - minDist)/2) + 5;
						_currentEnemy.y = Math.sin(ang) + ((dist - minDist)/2) + 5;
					}
				}
				j = 0;
		}
		
		//Проверка столкновений противников друг с другом
		public static function hitEnemy(Enemys: Array):void
		{
			for (var i: Number = 0; i < Enemys.length; i++)
			{
				for (var j: Number = 0; j < Enemys.length; j++)
				{
					if (Enemys[i].hitTestObject(Enemys[j]))
					{
						var square = Math.PI * Math.sqrt(Enemys[i].width);
						
						if (Enemys[i].width < Enemys[j].width)
						{
							Enemys[j].width = Enemys[j].height += square;
							Enemys[i].width = Enemys[i].height = 0;
							Enemys[i] = null;
							Enemys.splice(i,1);
							countEnemies--;
						}
					}
					else if (Enemys[j].hitTestObject(Enemys[i]))
					{
						square = Math.PI * Math.sqrt(Enemys[j]);
						
						if (Enemys[j].width < Enemys[i].width)
						{
							Enemys[i].width = Enemys[i].height += square;
							Enemys[j].width = Enemys[j].height = 0;
							Enemys[j] = null;
							Enemys.splice(j,1);
							countEnemies--;
						}
					}
				}
				j = 0;
			}
			i = 0;
		}
	}
	
}
