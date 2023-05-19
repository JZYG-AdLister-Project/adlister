`use strict`;

//Arrow IIFE
(() => {
	const adCardsParent = document.querySelector('.ad-cards');

	// Event listener for the edit button
	adCardsParent.addEventListener('click', (event) => {
		if (event.target.id === 'edit-btn') {
			editButton();
		}
	});

	const editButton = () => {
		const editTitleLabel = event.target.previousElementSibling.children[0];
		const editTitle = event.target.previousElementSibling.children[1];
		const editDescriptionLabel = event.target.previousElementSibling.children[2];
		const editDescription = event.target.previousElementSibling.children[3];
		const currentTitle = event.target.previousElementSibling.previousElementSibling.previousElementSibling;
		const currentDescription = event.target.previousElementSibling.previousElementSibling;
		const deleteDoneRow = event.target.parentElement.nextElementSibling;
		const editButton = event.target;

		editTitleLabel.classList.toggle('invisible');
		editTitle.classList.toggle('invisible');
		editDescriptionLabel.classList.toggle('invisible');
		editDescription.classList.toggle('invisible');
		currentTitle.classList.add('invisible');
		currentDescription.classList.add('invisible');
		deleteDoneRow.classList.toggle('invisible');
		editButton.classList.add('invisible');
	}

})();