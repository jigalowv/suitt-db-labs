### Відношення member (користувач)
![member](./db/tables/member.png)

Функціональні залежності:
- m_id → m_login, m_email, m_phc, m_registration_dt  

Детермінанти відношення:
- m_id

Потенційні ключі:
- m_id

Кожен детермінант є потенційним ключем. Умова НФБК виконана.  

### Відношення contact_type (тип контакту)
![contact_type](./db/tables/contact_type.png)

Функціональні залежності:
- ct_id → ct_title  

Детермінанти відношення:
- ct_id

Потенційні ключі:
- ct_id

Кожен детермінант є потенційним ключем. Умова НФБК виконана.  

### Відношення contact (контакт)
![contact](./db/tables/contact.png)

Функціональні залежності:
- c_id → member_id, contact_type_id, c_value  

Детермінанти відношення:
- c_id

Потенційні ключі:
- c_id

Кожен детермінант є потенційним ключем. Умова НФБК виконана.  

### Відношення performer (виконавець)
![performer](./db/tables/performer.png)

Функціональні залежності:
- member_id → expected_income_id, p_experience, p_resume, p_promoted_at  

Детермінанти відношення:
- member_id

Потенційні ключі:
- member_id

Кожен детермінант є потенційним ключем. Умова НФБК виконана.  

### Відношення income_range (діапазон доходу)
![income_range](./db/tables/income_range.png)

Функціональні залежності:
- ir_id → ir_min, ir_max  

Детермінанти відношення:
- ir_id

Потенційні ключі:
- ir_id

Кожен детермінант є потенційним ключем. Умова НФБК виконана.  

### Відношення skill (навичка)
![skill](./db/tables/skill.png)
Функціональні залежності:
- s_id → s_title  

Детермінанти відношення:
- s_id

Потенційні ключі:
- s_id

Кожен детермінант є потенційним ключем. Умова НФБК виконана.  

### Відношення performer_skill (навичка виконавця)
![performer_skill](./db/tables/performer_skill.png)

Функціональні залежності:
- ps_id → performer_id, skill_id
- (performer_id, skill_id) → ps_id

Детермінанти відношення:
- ps_id
- (performer_id, skill_id)

Потенційні ключі:
- ps_id
- (performer_id, skill_id)

Кожен детермінант є потенційним ключем. Умова НФБК виконана.  

### Відношення customer (замовник)
![customer](./db/tables/customer.png)

Функціональні залежності:
- member_id → ∅ (немає додаткових атрибутів, крім ключа)

Детермінанти відношення:
- member_id

Потенційні ключі:
- member_id

Кожен детермінант є потенційним ключем. Умова НФБК виконана.  

### Відношення required_skill (необхідна навичка замовлення)
![required_skill](./db/tables/required_skill.png)

Функціональні залежності:
- rs_id → order_id, skill_id
- (order_id, skill_id) → rs_id

Детермінанти відношення:
- rs_id
- (order_id, skill_id)

Потенційні ключі:
- rs_id
- (order_id, skill_id)

Кожен детермінант є потенційним ключем. Умова НФБК виконана.  

### Відношення order (замовлення)
![order](./db/tables/order.png)

Функціональні залежності:
- o_id → customer_id, income_range_id, o_title, o_description, o_status, o_created_at, o_updated_at, o_deadline, o_promoted_at  

Детермінанти відношення:
- o_id

Потенційні ключі:
- o_id

Кожен детермінант є потенційним ключем. Умова НФБК виконана.  

### Відношення perform_request (запит на виконання)
![perform_request](./db/tables/perform_request.png)

Функціональні залежності:
- pr_id → order_id, performer_id, pr_created_at, pr_status  
- (order_id, performer_id) → pr_id, pr_created_at, pr_status  

Детермінанти відношення:
- pr_id
- (order_id, performer_id)

Потенційні ключі:
- pr_id
- (order_id, performer_id)

Кожен детермінант є потенційним ключем. Умова НФБК виконана.  

### Відношення comment (відгук/коментар)
![member](./db/tables/member.png)

Функціональні залежності:
- c_id → finished_order_id, c_from, c_to, c_content, c_created_at, c_type  

Детермінанти відношення:
- c_id

Потенційні ключі:
- c_id

Кожен детермінант є потенційним ключем. Умова НФБК виконана.  
