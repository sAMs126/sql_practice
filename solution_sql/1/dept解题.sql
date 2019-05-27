-- 查找最晚入职员工的所有信息
		-- 1.先找到最晚的时间
		-- SELECT MAX(s.hire_date) FROM employees s
		-- 2.根据时间找出对应的员工
SELECT * FROM employees s1
WHERE s1.hire_date = 
(SELECT MAX(s.hire_date) FROM employees s)

-- 查找入职员工时间排名倒数第三的员工所有信息
		-- 1.查询倒数(DESC)第三的入职时间 *去重 DISTINCT*
		-- 2.根据时间找出对应的员工
SELECT * FROM employees s1
WHERE s1.hire_date = 
(SELECT DISTINCT hire_date FROM employees ORDER BY hire_date desc LIMIT 2,1)

-- 查找各个部门当前(to_date='9999-01-01')领导当前薪水详情以及其对应部门编号dept_no
		-- 1.主表是薪水表
		-- 2.注意薪水截止时间
SELECT s.emp_no, s.salary, s.from_date, s.to_date, m.dept_no FROM salaries s
LEFT JOIN dept_manager m ON s.emp_no = m.emp_no
WHERE s.to_date = '9999-01-01'
AND m.to_date='9999-01-01'

-- 查找所有已经分配部门的员工的last_name和first_name
		-- 1.查找已分配部门员工 is not null
SELECT last_name, first_name, dept_no FROM employees
LEFT JOIN dept_emp ON employees.emp_no = dept_emp.emp_no
WHERE dept_emp.dept_no IS NOT NULL

	-- 链接：https://www.nowcoder.com/questionTerminal/6d35b1cd593545ab985a68cd86f28671
	-- 来源：牛客网
	-- 利用内连接可获取两表的公共部分的记录  https://www.cnblogs.com/shaoguan/p/6524045.html

SELECT
	employees.last_name,
	first_name,
	dept_emp.dept_no 
FROM
	dept_emp
	INNER JOIN employees ON dept_emp.emp_no = employees.emp_no;

-- 查找所有员工的last_name和first_name以及对应部门编号dept_no，也包括展示没有分配具体部门的员工
SELECT last_name, first_name, dept_no FROM employees
LEFT JOIN dept_emp ON employees.emp_no = dept_emp.emp_no

-- 查找所有员工入职时候的薪水情况，给出emp_no以及salary， 并按照emp_no进行逆序
		-- 1. 查找所有入职时薪水
		-- 2. 根据emp_no进行降序排列
SELECT
	employees.emp_no,
	salaries.salary 
FROM
	employees
	LEFT JOIN salaries ON employees.emp_no = salaries.emp_no 
WHERE
	employees.hire_date = salaries.from_date 
ORDER BY
	employees.emp_no DESC

-- 查找薪水涨幅超过15次的员工号emp_no以及其对应的涨幅次数t
		-- 1. 查找涨幅超过15次的员工
		-- 2. 获取涨幅次数
SELECT
	count.emp_no,
	count.t 
FROM
	( SELECT COUNT( emp_no ) AS t, emp_no FROM salaries GROUP BY emp_no ) AS count 
WHERE
	count.t > 15
	
	-- 链接：https://www.nowcoder.com/questionTerminal/6d4a4cff1d58495182f536c548fee1ae
	-- 来源：牛客网

	-- 1、用COUNT()函数和GROUP BY语句可以统计同一emp_no值的记录条数
	-- 2、根据题意，输出的涨幅次数为t，故用AS语句将COUNT(emp_no)的值转换为t
	-- 3、由于COUNT()函数不可用于WHERE语句中，故使用HAVING语句来限定t>15的条件

	-- 还有就是为什么没有用where而是用的having，记住下面的两句话就好了。

	-- WHERE语句在GROUP BY语句之前；SQL会在分组之前计算WHERE语句。   
	-- HAVING语句在GROUP BY语句之后；SQL会在分组之后计算HAVING语句。
	SELECT emp_no, COUNT(emp_no) AS t FROM salaries 
	GROUP BY emp_no HAVING t > 15

-- 找出所有员工当前(to_date='9999-01-01')具体的薪水salary情况，对于相同的薪水只显示一次,并按照逆序显示
		-- 1. 查询员工当前工资
		-- 2. 按工资分组并逆序排列
-- 	**	大表一般用distinct效率不高，大数据量的时候都禁止用distinct，建议用group by解决重复问题
SELECT
	salary 
FROM
	salaries 
WHERE
	salaries.to_date = '9999-01-01' 
GROUP BY
	salary 
ORDER BY
	salary DESC
	
-- 	获取所有部门当前manager的当前薪水情况，给出dept_no, emp_no以及salary，当前表示to_date='9999-01-01'

SELECT
	dept_manager.dept_no,
	dept_manager.emp_no,
	salaries.salary 
FROM
	dept_manager
	LEFT JOIN salaries ON dept_manager.emp_no = salaries.emp_no 
WHERE
	salaries.to_date = '9999-01-01' 
	AND dept_manager.to_date = '9999-01-01'
	
	-- 因为同一emp_no在salaries表中对应多条涨薪记录，而当s.to_date = '9999-01-01'时是该员工当前的薪水记录
SELECT
	dept_manager.dept_no,
	dept_manager.emp_no,
	salaries.salary 
FROM
	dept_manager
	INNER JOIN salaries ON dept_manager.emp_no = salaries.emp_no 
	AND dept_manager.to_date = '9999-01-01' 
	AND salaries.to_date = '9999-01-01'
	
-- 获取所有非manager的员工emp_no
SELECT
	emp_no 
FROM
	employees 
WHERE
	employees.emp_no NOT IN ( SELECT emp_no FROM dept_manager )
		
	-- MySQL官方文档有说明，in关键字适合确定数量的情况，一般效率较低，不推荐使用。能用in关键字的语句都可以转化为使用join的语句，推荐使用join关键字。
SELECT
	employees.emp_no 
FROM
	employees
	LEFT JOIN dept_manager ON employees.emp_no = dept_manager.emp_no 
WHERE
	dept_manager.emp_no IS NULL
	
-- 获取所有员工当前的manager，如果当前的manager是自己的话结果不显示，当前表示to_date='9999-01-01'。
-- 结果第一列给出当前员工的emp_no,第二列给出其manager对应的manager_no。
SELECT
	dept_emp.emp_no,
	dept_manager.emp_no AS manager_no 
FROM
	dept_emp
-- 	LEFT JOIN dept_manager ON dept_emp.dept_no = dept_manager.dept_no 
	INNER JOIN dept_manager ON dept_emp.dept_no = dept_manager.dept_no 
WHERE
	dept_emp.to_date = '9999-01-01' 
	AND dept_manager.to_date = '9999-01-01' 
	AND dept_emp.emp_no != dept_manager.emp_no
	
-- 	获取所有部门中当前员工薪水最高的相关信息，给出dept_no, emp_no以及其对应的salary
SELECT
	dept_no,
	dept_emp.emp_no,
	salary 
FROM
	dept_emp
	INNER JOIN salaries ON dept_emp.emp_no = salaries.emp_no 
WHERE
	salaries.to_date = '9999-01-01' 
	AND dept_emp.to_date = '9999-01-01' 
GROUP BY
	dept_emp.dept_no 
HAVING
	MAX( salary )
	
	-- 链接：https://www.nowcoder.com/questionTerminal/4a052e3e1df5435880d4353eb18a91c6
	-- 来源：牛客网
	-- 
	-- 如果存在多条最大记录怎么办？而 MAX 函数根据不同数据库只选择最前一条或最后一条最大记录，其余记录均被忽略。此时解法如下：
	-- 1、创建两张表，一张为maxsalary，用于存放当前每个部门薪水的最大值；另一张为currentsalary，用于存放当前每个部门所有员工的编号和薪水；
	-- 2、限定条件为两张表的 dept_no 和 salary 相等，这样就可以找出当前每个部门所有薪水等于最大值的员工的相关信息了；
	-- 3、最后记得根据 currentsalary.dept_no 升序排列，输出与参考答案相同的记录表。
	
