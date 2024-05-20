var course = [
    {
      id: 1,
      name: 'javascript',
      coint: 250
    },
    {
      id: 2,
      name: 'C#',
      coint: 280
    },
    {
      id: 3,
      name: 'java',
      coint: 130
    },
    {
      id: 4,
      name: 'react',
      coint: 0
    }
  ];
  
  var i = 0;
  function Q(acc, currentValue, cr, ori){
    i++;
    var total = acc + currentValue.coint
    console.table({
      'luot chay': i,
      'Bien tich tru': acc,
      'gia khoa hoc': currentValue.coint,
      'tich tru duoc': total
    });
  return total;
  };
  
  var total = course.reduce(Q, 0);
  console.log(total);


  // lam phang mang tu depth aray 
var depthArray = [1,2,[3,4],5,6,[7,8,9]];
var flatArray = depthArray.reduce(function(flatOutput, depthItem){
return flatOutput.concat(depthItem);
}, []);
console.log(flatArray)