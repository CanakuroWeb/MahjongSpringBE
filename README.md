# 메모
## Gradle에서 나던 에러
- 한번 빌드하고 나면 에러 안잡힘.
- JVM 17사용함.

# SQL

# 2023년 04 월 09 일 추가

## SQL 기본 문법 
- PostgreSQL 기준 설명
- PostgreSQL는 PGAdmin이라는 툴을 가지고 있음. 

### 쿼리문의 구성
- 이 부분은 MySQL과 공통적 (ANSI sql문)
- (명령문) (제한,조건등) ;<중요
### 데이터의 선택과 수정
#### SELECT 
```SQL
    SELECT {컬럼 이름},{이름 2...} FROM {tb_name}
```
- FROM 뒤에 있는 tb_name의 컬럼이름들을 다 가져옴.
- 뒤에 제한조건젏이 없다면, 모든 데이터를 가져옴.
- AS구문을 통하여 컬럼이름을 특정 이름으로 지정가능함. 요컨데...

```SQL
    SELECT {컬럼 이름} AS cul1 ,{이름 2...} FROM {tb_name}
```
- 이라면, cul1이라는 이름으로 뽑아옴.

#### INSERT 
```sql
    INSERT INTO tb_name (cul1,cul2) VALUES (?1,?2)
```
- tb_name의 cul1에 ?1, cul2에 ?2인 값을 가지는 row를 INSERT<삽입>함.

#### DELETE 

```sql
    DELETE FROM tb_name
```
- tb_name의 **row**를 삭제함. 
- WHERE절이 없는 경우, TB속 모든 데이터가 삭제되니 주의.

#### UPDATE
```sql
    UPDATE tb_name SET cul1='val2' 
```
- tb_name의 **row**의 데이터를 변경함. 
- WHERE절이 없는 경우, TB속 모든 데이터가 변경되니 주의.


### 데이터의 제한

```SQL
    SELECT {컬럼 이름},{이름 2...} FROM {tb_name}
```
- 이러면 모든 데이터가 불러와진다.
- 만약, {컬럼 이름} > 15 AND {컬럼 이름2} = 16의 조건을 적용하고 싶다면, WHERE로 조건을 제한하면 된다.

```SQL
    SELECT {컬럼 이름},{이름 2...} FROM {tb_name} WHERE {컬럼 이름} > 15 AND {컬럼 이름2} = 16
```
> := 대입   
> = 대입도 되고 동일함을 따질때도 씀     

