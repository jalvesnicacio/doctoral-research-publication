from sklearn.feature_extraction.text import CountVectorizer
from sklearn.metrics.pairwise import cosine_similarity
from sklearn.feature_extraction.text import TfidfVectorizer
import pandas as pd

doc_1 = "Data is the oil of the digital economy"
doc_2 = "Data is a new oil"

data = [doc_1, doc_2]

count_vectorizer = CountVectorizer()
vector_matrix = count_vectorizer.fit_transform(data)
tokens = count_vectorizer.get_feature_names()
vector_matrix.toarray()

def create_dataframe(matrix, tokens):
    
    doc_names = [f'doc_{i+1}' for i, _ in enumerate(matrix)]
    df = pd.DataFrame(data=matrix, index=doc_names, columns=tokens)
    return(df)

create_dataframe(vector_matrix.toarray(),tokens)

cosine_similarity_matrix = cosine_similarity(vector_matrix)
print(create_dataframe(cosine_similarity_matrix,['doc_1','doc_2']))

Tfidf_vect = TfidfVectorizer()
vector_matrix = Tfidf_vect.fit_transform(data)

