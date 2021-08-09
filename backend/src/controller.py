from src.firebase import ref

def getSemaphoreStates():
	values = ref.get()
	return values